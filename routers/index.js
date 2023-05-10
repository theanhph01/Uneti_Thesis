const controllers = require("../controllers");
const router = require("express").Router();
const multer = require("../middleware/multer");
const roleAdmin = require("../middleware/adminRole");
const checkLogin = require("../middleware/checkLogin");
//Login
router.get("/login", controllers.authController.getLogin);
router.post("/login", controllers.authController.postLogin);

//Sign-up
router.get("/sign-up", controllers.authController.getSignup);
router.post("/sign-up", controllers.authController.postSignup);

//Log-out
router.get("/log-out", controllers.authController.getLogout);

//ForgotPassWord
router.get("/forgot-password", controllers.authController.getForgotPass);
router.post("/forgot-password", controllers.authController.postForgotPass);

//Users
router.get("/profile", checkLogin, controllers.adminController.getUserProfile);
router.post("/profile/updatepass", controllers.adminController.changePass);
router.post("/profile/updateprofile", multer.any(), controllers.adminController.updateProfile);

//Admin
router.get("/users-manager", roleAdmin, controllers.adminController.getUserManager);
router.get("/products-manager", roleAdmin, controllers.oderControler.getAllProductForAdmin);
router.get("/products-manager/:user_id/:order_id", controllers.oderControler.getProductByOrder);
router.post("/products-manager", controllers.oderControler.updateOrderState);

//Category
router.get("/categories", checkLogin, roleAdmin, controllers.adminControllerCategory.getAllCategory);
router.post("/categories", controllers.adminControllerCategory.addCategory);
router.post("/categories/delete", controllers.adminControllerCategory.deleteCategory);
router.post("/categories/update", controllers.adminControllerCategory.updateCategory);

//Product
router.get("/products", checkLogin, roleAdmin, controllers.productController.getAllProduct);
router.get("/categories/view/:id", controllers.productController.getProductsByIdCategory);//Hiện thị danh sách sản phẩm của 1 danh mục
router.post("/products/delete", controllers.productController.deleteProduct);
router.post("/products/create", multer.any(), controllers.productController.creatProduct);
router.get("/products/show/:id", controllers.productController.getOneProduct);
router.post("/products", controllers.productController.updateProduct);

//Home 
router.get("/home", controllers.homeController.getHome);
router.get("/home/productdetails/:id",controllers.homeController.getProductDetails);
router.post("/home/productdetails/:id",controllers.homeController.InsertProductOrder);

//Cart
router.get("/order-cart", checkLogin, controllers.oderControler.getOrderState_0);
router.post("/order-cart/delete", controllers.oderControler.deleteProductOnOrder);
router.get("/oder-cart/old-product/:order_id", controllers.oderControler.getOldProduct);
router.get("/oder-cart/price-old-product/:order_id", controllers.oderControler.getPriceOldProduct);
router.post("/order-cart/checkout", controllers.oderControler.updateOrderState1);

//Checkout
router.get("/check-out", checkLogin, controllers.oderControler.getCheckOut);

// Search
router.get("/home/search", controllers.homeController.searchHome);
router.get("/home/search/:category_id", controllers.homeController.searchCategory);

//Chart
router.get("/chart",checkLogin, roleAdmin, controllers.chartController.getProductChartToday);
router.get("/chart/revenue", controllers.chartController.getProductChart);

//Chats
router.get("/chats/user", checkLogin, controllers.chatController.getChatUser);
router.get("/chats/admin", controllers.chatController.getChatAdmin);


router.use((req, res, next)=> {
    next({status:404, message: "Trang truy cập không tồn tại"})
})

router.use((err, req, res, next)=> {
    if(!err.status){ 
        err = {};
        err.status = 500;
        err.message = "Oops! trang bạn truy cập đã xảy ra lỗi";
    }
    res.render("404", err);
})

module.exports = router;