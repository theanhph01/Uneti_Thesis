const productsModal = require("../models/product.modal");
const orderModal = require("../models/order.modal");
const categoryModal = require("../models/category.modal");

class Home {
    //Trang chủ
    async getHome(req, res, next) {
        let products = await productsModal.getProductswithImages();
        // let category = await categoryModal.searchCategory(products.category_id);
        let category = await categoryModal.getAllCategory();
        res.render('home-products', {
            products: products,
            user: req.user,
            category: category
        })
    }
    //Tìm kiếm ở trang chủ
    async searchHome(req, res, next) {
        let products = await productsModal.getSearchProduct(req.query.key);
        // res.render('home-products', {
        //     products: products,
        //     user: req.user,
        // })
        res.json(products);
    }
    async searchCategory(req, res, next){
        let category_id = req.params.category_id;
        let products = await categoryModal.searchCategory(category_id);
        let category = await categoryModal.getAllCategory();
        //console.log(products);
        res.render('home-products', {
            products: products,
            user: req.user,
            category: category,
        })
    }


    //Hiện thị trang chi tiết sản phẩm
    async getProductDetails(req, res, next) {
        let id = parseInt(req.params.id);
        let product = await productsModal.getProductswithImagesById(id);
        // let state_0 = await orderModal.getOrderState0(req.user.id);
        let category = await categoryModal.getAllCategory();
        res.render('product-details', {
            product: product[0],
            user: req.user,
            category: category,
        })
    }

    //Thêm sản phẩm vào Order_State_0
    async InsertProductOrder(req, res, next) {
        let idProduct = parseInt(req.params.id);
        let state_0 = await orderModal.getOrderState0(req.user.id);
        let productExist;
        if (state_0) {
            productExist = await orderModal.selectOrderExist(idProduct, state_0[0].order_id);
        }
        if (!state_0) {
            await orderModal.insertOrder(req.user.id);
            let new_order = await orderModal.getOrderState0(req.user.id);
            if (new_order) {
                await orderModal.insertOrderHasProduct(idProduct, new_order[0].order_id, req.body.quantity);
            }
        }
        else if (!productExist) {
            await orderModal.insertOrderHasProduct(idProduct, state_0[0].order_id, req.body.quantity);
        }
        else {
            var quantity = parseInt(productExist[0].quantity) + parseInt(req.body.quantity);
            await orderModal.updateOrderHasProduct(quantity, state_0[0].order_id, idProduct);
        }
        res.redirect("/home");
    }

}



module.exports = new Home;