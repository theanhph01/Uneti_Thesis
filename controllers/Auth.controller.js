const SHA256 = require('crypto-js/sha256');
const usersModel = require('../models/users.model');
const profileModal = require('../models/profiles.model');
const sha256 = require('crypto-js/sha256');
const jwt = require("jsonwebtoken");
class Auth {
    //-----GET-----
    //Login
    getLogin(req, res, next) {
        res.render("login");
    }

    //Signup
    getSignup(req, res, next) {
        res.render("signup");
    }
    getForgotPass(req, res, next) {
        res.render("forgot-pass");
    }

    //-----POST-----
    //Lgin
    async postLogin(req, res, next) {
        let username = req.body.username;
        let password = SHA256(req.body.password).toString();
        let user = await usersModel.login(username, password);
        if (user) {
            let token = jwt.sign({id: user.user_id,
                username: user.user_name,
                role: user.user_role}, 
                process.env.SECRET_KEY_JWT);
            res.cookie("token", token);
            res.redirect("/home");
        }
        else {
            res.render('login', {
                message: 'Mật khẩu hoặc tài khoản không đúng'
            })
        }
    }

    //Logout
    async getLogout(req, res, next){
        res.cookie("token", "");
        res.redirect("/login");
    }

    //Signup
    async postSignup(req, res, next) {
        let username = req.body.user_name;
        let password = SHA256(req.body.password1).toString();
        let email = req.body.email;
        let user = await usersModel.getEmail(email);
        if (!user) {
            user = await usersModel.getUsername(username);
            if (!user) {
                user = await usersModel.creat(username, password, email);
                if (user) {
                    await profileModal.creat(req.body.fullname, req.body.phone_number,
                        req.body.birthday, req.body.gender, req.body.job, user.insertId);
                    return res.redirect("/login");
                }
                else {
                    next({
                        status: 500,
                        message: 'Lỗi server!'
                    })
                }
            }
            else {
                res.render("signup", { message: "Username này đã tồn tại!" })
            }
        }
        else {
            res.render('signup', { message: "Email bạn đăng ký đã tồn tại!" });
        }
    }

    //Forgot-password
    async postForgotPass(req, res, next) {
        let email = req.body.email;
        let username = req.body.user_name;
        let password = sha256(req.body.password1).toString();
        let user = await usersModel.getUserByUsernameandEmail(username, email);
        if (user) {
            await usersModel.updatePass(user.user_id, password);
           res.redirect('/login');
        }
        else{
            
        }
    }
}




module.exports = new Auth;