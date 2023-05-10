const conn = require('../config/connectMySQL').conn;

function getProductChart(updated_at) {
    // let sql = `SELECT SUM(products_has_orders.quantity * products.price) as total_price, products.product_name
    // FROM orders
    // LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id
    // LEFT JOIN products ON products_has_orders.products_product_id = products.product_id
    // WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= orders.updated_at AND orders.state = 3
    // GROUP BY products.product_name;` ;
    let sql = `SELECT SUM(products_has_orders.quantity * products.price) as total_price, products.product_name FROM orders 
                LEFT JOIN products_has_orders ON orders.order_id = products_has_orders.orders_order_id 
                LEFT JOIN products ON products_has_orders.products_product_id = products.product_id 
                WHERE DATE(orders.updated_at) = DATE(?) AND orders.state = 3 
                GROUP BY products.product_name
                ORDER BY total_price DESC`
                
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [updated_at] ,(err, result) => {
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



module.exports = {
    getProductChart: getProductChart,
}