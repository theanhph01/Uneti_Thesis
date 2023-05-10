module.exports = async function checkLogin(req, res, next) {
    if(req.user != null) {
        next();
    }
    else {
        res.redirect("login");
    }
}