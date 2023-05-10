const orderModal = require("../models/order.modal");
const categoryModal = require("../models/category.modal");

class Order{
    async getOrderState_0(req, res, next) {
        let order = await orderModal.getOrderState0(req.user.id);
        let old_order = await orderModal.getOrderState1(req.user.id);
        let category = await categoryModal.getAllCategory();
        res.render('order-cart', {
            order: order,
            old_order: old_order,
            user: req.user,
            category: category,
        })
    }

    async getOldProduct(req, res, next) {
        let order_id = req.params.order_id;
        let old_product = await orderModal.getOldProduct(req.user.id, order_id);
        res.send(old_product);
    }
    async getPriceOldProduct(req, res, next) {
        let order_id = req.params.order_id;
        let sum_product = await orderModal.getSumOldProduct(req.user.id, order_id);
        res.send(sum_product);
    }

    async deleteProductOnOrder(req, res, next) {
        await orderModal.deleteOrderHasProduct(req.body.id);
        res.redirect('/order-cart');
    }

    //Của Admin
    async getAllProductForAdmin(req, res, next){
        let orders = await orderModal.getAllOrder();
        let category = await categoryModal.getAllCategory();
        res.render('products-manager', {
            orders: orders,
            category: category,
            user: req.user,
        })
    }
    async updateOrderState(req,res, next){
        let order = await orderModal.getOneOrder(req.body.order_id);
        if(order[0].state == 1){
            await orderModal.upDateOrderState(req.body.order_id, 2);
        }
        else if(order[0].state == 2){
            await orderModal.upDateOrderState(req.body.order_id, 3);
        }
        res.redirect('/products-manager');
    }

    async getProductByOrder(req, res, next){
        let user_id = req.params.user_id;
        let order_id = req.params.order_id;
        let products = await orderModal.getProductByOrder(user_id, order_id);
        res.send(products);
    }

    async updateOrderState1(req,res, next){
        await orderModal.upDateOrderState(req.body.order_checkout, 1);
        res.redirect("/check-out");
    }

   

    //CheckOut
    async getCheckOut(req,res, next){
        let category = await categoryModal.getAllCategory();
        res.render('check-out',{
            user: req.user,
            category: category,
        });
    }
    

}

module.exports = new Order;