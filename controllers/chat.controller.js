const categoryModal = require('../models/category.modal');
const users = require("../models/users.model");
class Chat{

    async getChatUser(req, res, next) {
        let category = await categoryModal.getAllCategory();
        res.render("chatUser", {
            category: category,
            user: req.user,
        });
    }

    async getChatAdmin(req, res, next) {
        let category = await categoryModal.getAllCategory();
        let user = await users.getAllUsers();
        res.render("chatAdmin", {
            category: category,
            user: req.user,
            users: user
        });
    }
}

module.exports = new Chat();