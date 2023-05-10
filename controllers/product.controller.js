const productsModal = require("../models/product.modal");
const categoriesModal = require("../models/category.modal");
class Product {
    //-----Get-----
    async getAllProduct(req, res, next) {
        let products = await productsModal.getAllProduct();
        let categories = await categoriesModal.getAllCategory();
        let category = await categoriesModal.getAllCategory();
        res.render('products', {
            products: products,
            categories: categories,
            category: category,
            user: req.user,
        })
    }
    
    async getProductsByIdCategory(req, res, next) {
        let id = req.params.id;
        let products = await productsModal.getProduct(id);
        res.send(products);
    }

    async deleteProduct(req, res, next) {
        let id = req.body.id;
        let product = await productsModal.deleteProducts(id);
        res.redirect('/products');
        
    }

    async creatProduct(req, res, next) {
        let product;
        if (req.body.tensp.length > 0) {
            if (req.body.tinhtrang.length > 0) {
                if (req.body.price.length > 0) {
                    if (req.body.content.length > 0) {
                        if (req.files.length > 0) {
                            product = await productsModal.insertProducts(req.body.tensp, req.body.price, req.body.content, req.body.tinhtrang);
                            if (Array.isArray(req.body.danhmuc)) {
                                for (let i = 0; i < req.body.danhmuc.length; i++) {
                                    await productsModal.insertProductsHasCategory(product.insertId, req.body.danhmuc[i]);
                                }
                            }
                            else {
                                await productsModal.insertProductsHasCategory(product.insertId, req.body.danhmuc);
                            }
                            for(let i = 0; i < req.files.length; i++){
                                await productsModal.insertImage(req.files[i].filename, product.insertId);
                            }
                        }

                    }
                }
            }
        }
        if (product) {
            res.redirect('/products');
        }
    }

    async updateProduct(req, res, next) {
        let product = await productsModal.updateProduct(req.body.idProduct, req.body.edit_price, req.body.edit_content, req.body.edit_tinhtrang);
        if (product) {
            res.redirect('/products');
        }
        
    }

    async getOneProduct(req, res, next) {
        let id = req.params.id;
        let product = await productsModal.getOneProduct(id);
        res.send(product);
    }
    
}

module.exports = new Product;
