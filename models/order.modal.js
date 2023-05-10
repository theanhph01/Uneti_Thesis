const conn = require('../config/connectMySQL').conn;


//Lấy dữ liệu Order chưa thanh toán
function getOrderState0(user_id) {
    let sql = `SELECT users.user_id, orders.state, orders.order_id, orders.created_at, orders.updated_at, products_has_orders.quantity, products.product_id, products.product_name, products.price, products.contents, images.file_name
                FROM orders
                LEFT JOIN users ON orders.users_user_id = users.user_id
                LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id
                LEFT JOIN products ON products_has_orders.products_product_id = products.product_id
                LEFT JOIN images ON products.product_id = images.products_product_id
                WHERE users.user_id = ? AND orders.state = 0;`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

//Lấy dữ liệu đã thanh toán
function getOrderState1(user_id) {
    let sql = `SELECT orders.updated_at, users.user_id, orders.order_id from orders
                LEFT JOIN users ON users.user_id = orders.users_user_id
                WHERE orders.state = 3 AND users.user_id = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

function getOldProduct(user_id, order_id) {
    let sql = `SELECT users.user_id, orders.state, products_has_orders.quantity, products.product_id, products.product_name, products.price
                FROM orders
                LEFT JOIN users ON orders.users_user_id = users.user_id
                LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id
                LEFT JOIN products ON products_has_orders.products_product_id = products.product_id
                WHERE users.user_id = ? AND orders.order_id = ? AND orders.state = 3` ;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id, order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}
function getSumOldProduct(user_id, order_id) {
    let sql = `SELECT SUM(products_has_orders.quantity * products.price) AS total
            FROM orders
            LEFT JOIN users ON orders.users_user_id = users.user_id
            LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id
            LEFT JOIN products ON products_has_orders.products_product_id = products.product_id
            WHERE users.user_id = ? AND orders.order_id = ? AND orders.state = 3` ;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id, order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

//Thêm bảng Order
function insertOrder(user_id) {
    let sql = `Insert into orders (users_user_id)
               Values (?)`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

//Thêm vào bảng ProductHasOrder
function insertOrderHasProduct(product_id, order_id, quantity) {
    let sql = `Insert into products_has_orders (products_product_id, orders_order_id, quantity)
               Values (?, ?, ?)`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [product_id, order_id, quantity], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}
//Update vào bảng ProductHasOrder
function selectOrderExist(product_id, order_id) {
    let sql = `Select * from products_has_orders
               Where products_product_id = ? AND orders_order_id = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [product_id, order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}
function updateOrderHasProduct(quantity, order_id, product_id) {
    let sql = `Update products_has_orders
               Set quantity = ?
               Where orders_order_id = ? AND products_product_id = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [quantity, order_id, product_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

//Xoá sản phẩm trong order
function deleteOrderHasProduct(product_id) {
    let sql = `Delete from products_has_orders 
                where products_product_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [product_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}
function deleteOrder(order_id) {
    let sql = `Delete from orders
                where order_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getAllOrder(){
    let sql = `Select orders.order_id, users.user_id, orders.state, orders.created_at, users.user_name, users.email from orders inner join users on orders.users_user_id = users.user_id`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getProductByOrder(user_id, order_id){
    let sql = `SELECT profiles.fullname, profiles.phone_number, products_has_orders.quantity, products.product_name, products.price, orders.state
    FROM orders
    LEFT JOIN users ON orders.users_user_id = users.user_id
    LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id
    LEFT JOIN products ON products_has_orders.products_product_id = products.product_id
    LEFT JOIN profiles ON profiles.users_user_id = users.user_id
    WHERE users.user_id = ? AND orders.order_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql,[user_id, order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function upDateOrderState(order_id, state, updated_at){
    let sql =  `Update orders
                Set state = ?, updated_at = ?
                Where order_id = ? `
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [state, new Date(), order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getOneOrder(order_id){
    let sql =  `Select * from orders
                Where order_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [order_id], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getNumberProductCart(user_id){
    let sql =  `Select count(products_product_id) as numbers from orders
                Inner join products_has_orders on products_has_orders.orders_order_id = orders.order_id
                Where orders.users_user_id = ? and orders.state = 0`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                        resolve(result);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}




module.exports = {
    insertOrder: insertOrder,
    insertOrderHasProduct,
    getOrderState0: getOrderState0,
    getOrderState1: getOrderState1,
    deleteOrder: deleteOrder,
    deleteOrderHasProduct: deleteOrderHasProduct,
    getOldProduct: getOldProduct,
    getSumOldProduct: getSumOldProduct,
    updateOrderHasProduct: updateOrderHasProduct,
    selectOrderExist: selectOrderExist,
    getAllOrder: getAllOrder,
    getProductByOrder: getProductByOrder,
    upDateOrderState: upDateOrderState,
    getOneOrder: getOneOrder,
    getNumberProductCart: getNumberProductCart,
}