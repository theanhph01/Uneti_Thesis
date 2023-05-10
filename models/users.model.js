const conn = require('../config/connectMySQL').conn;

//Login
function login(username, password) {
    let sql = `select * from users where user_name = ? and password = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [username, password], (err, result) => {
                if (!err) {
                    if (result.length > 0) {
                        resolve(result[0]);
                    }
                    else {
                        resolve(null);
                    }
                }
            })
        }
        catch (ex) {
            reject(null);
        }
    })
}

//Signup
function getUserByEmail(email) {
    let sql = `Select * from users where email = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [email], (err, result) => {
                if (!err) {
                    if (result.length > 0)
                        resolve(result);
                    else resolve(null);
                }
            })
        }
        catch (ex) {
            console.log(ex)
            reject(ex)
        }
    })
}
function getUserByUsername(username) {
    let sql = `Select * from users where user_name = ?`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [username], (err, result) => {
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
function signup(username, password, email) {
    let sql = `Insert into users (user_name, password, email) values(?, ?, ?)`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [username, password, email], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err)
                }
            })
        }
        catch (ex) {
            console.log(ex)
        }
    })
}

//Forgot-Password
function getUserByUsernameandEmail(username, email) {
    let sql = `Select * from users
                Where user_name = ? and email = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [username, email], (err, result) => {
            try {
                if (!err) {
                    resolve(result[0]);
                }
                else {
                    console.log(err);
                }
            }
            catch (ex) {
                console.log(ex);
            }
        })
    })
}
function updatePass(userId, password) {
    let sql = `Update users
                Set password = ?
                Where user_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [password, userId], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}
function checkPass(userId, oldPass) {
    let sql = `Select * from users
                Where user_id = ? AND password = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [userId, oldPass], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}
function changePass(userId, newPass) {
    let sql = `Update users
                Set password = ?
                Where user_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [newPass, userId], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getAllUsers() {
    let sql = `Select * from users inner join profiles on users_user_id = user_id`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

function getUsersById(user_id) {
    let sql = `Select * from users inner join profiles on profiles.users_user_id = users.user_id
               Where users.user_id = ?`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}

//Lấy số lượng sản phẩm đã mua
function getQuantity(user_id) {
    let sql = `SELECT products_has_orders.quantity
                FROM products_has_orders
                JOIN orders ON products_has_orders.orders_order_id = orders.order_id
                JOIN users ON orders.users_user_id = users.user_id
                WHERE users.user_id = ? AND orders.state = 3`
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [user_id], (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    console.log(err);
                }
            })
        }
        catch (ex) {
            console.log(ex);
        }
    })
}



module.exports = {
    login: login,
    creat: signup,
    getEmail: getUserByEmail,
    getUsername: getUserByUsername,
    getUserByUsernameandEmail: getUserByUsernameandEmail,
    updatePass: updatePass,
    getAllUsers: getAllUsers,
    getUsersById: getUsersById,
    getQuantity: getQuantity,
    changePass: changePass,
    checkPass: checkPass,
}