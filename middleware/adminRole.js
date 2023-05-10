module.exports = async function adminRole(req, res, next) {
    if(req.user != null) {
        if(req.user.role == 1) {
            next();
        }
        else {
            next({status: 403, message: "Bạn Không có quyên truy cập"})
        }
    }
}