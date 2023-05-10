const usersModel = require('../../models/users.model');
const profilesModal = require('../../models/profiles.model');
const categoryModal = require('../../models/category.modal');
const sha256 = require('crypto-js/sha256');



class Admin{
     //-----GET-----
    //Users_manager
    async getUserManager(req, res, next) {
        let users = await usersModel.getAllUsers();
        let category = await categoryModal.getAllCategory();
        res.render("users", {
            users: users,
            user: req.user,
            category: category,
        })
    }

    async getUserProfile(req, res, next){
        let profile = await usersModel.getUsersById(req.user.id);
        let quantity = await usersModel.getQuantity(req.user.id);
        let category = await categoryModal.getAllCategory();
        res.render("user-profile", {
            profile: profile[0],
            quantity: quantity.length,
            user: req.user,
            category: category,
        });
    }

    async changePass(req, res, next){
        let oldPass = sha256(req.body.oldPass).toString();
        let newPass = sha256(req.body.newPass).toString();
        let user = await usersModel.checkPass(req.user.id, oldPass);
        let profile = await usersModel.getUsersById(req.user.id);
        let quantity = await usersModel.getQuantity(req.user.id);
        let category = await categoryModal.getAllCategory();
        if(user.length > 0){
            await usersModel.changePass(req.user.id,newPass);
            res.render("user-profile", {
                profile: profile[0],
                quantity: quantity.length,
                user: req.user,
                message: "Đổi mật khẩu thành công",
                category: category,
            });
        }
        else{
            res.render("user-profile", {
                profile: profile[0],
                quantity: quantity.length,
                user: req.user,
                message: "Sai mật khẩu",
                category: category,
            });
        }
    }

    async updateProfile(req, res, next){
        let profile = await usersModel.getUsersById(req.user.id);
        let quantity = await usersModel.getQuantity(req.user.id);
        let category = await categoryModal.getAllCategory();
        if(req.files.length > 0){
            await profilesModal.updateProfile(req.user.id, req.body.email, req.body.fullName, req.body.address, req.body.birthday, req.body.phone_number ,req.body.gender, req.files[0].filename);
        }
        else{
            await profilesModal.updateProfile(req.user.id, req.body.email, req.body.fullName, req.body.address, req.body.birthday, req.body.phone_number ,req.body.gender, req.body.filename);
        }
        res.render("user-profile", {
            profile: profile[0],
            quantity: quantity.length,
            category: category,
            user: req.user,
            message: "Cập nhật thông tin thành công"
        });
    }


}

module.exports = new Admin;