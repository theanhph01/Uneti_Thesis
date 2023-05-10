const jwt = require("jsonwebtoken");
const userModal = require("../models/users.model");
const order_cart = require("../models/order.modal");
const categories = require('../models/category.modal');

module.exports = async function passport(req, res, next) {
    let token = req.cookies.token;
    if (token) {
        try {
            let decode = jwt.verify(token, process.env.SECRET_KEY_JWT);
            let profile = await userModal.getUsersById(decode.id);
            let number_cart = await order_cart.getNumberProductCart(decode.id);
            let product_order = await order_cart.getOrderState0(decode.id);
            let category = await categories.getAllCategory();
            req.user = {
                id: decode.id,
                role: decode.role,
                username: decode.username,
                avatar: profile[0].avatar,
                profile: profile[0],
                number_cart: number_cart[0].numbers,
                product_cart: product_order,
                category: category,
            }
        } catch (ex) {
            req.user = null;
        }
    }
    else {
        req.user = null;
    }
    next();
}