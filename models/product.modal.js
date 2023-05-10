const { get } = require('express/lib/response');
const conn = require('../config/connectMySQL').conn;

//Lấy dữ danh sách Products cho từng danh mục
async function getProduct(category_id) {
    let sql = `Select * from category left join products_has_category on category_category_id 
    = category_id left join products on product_id = products_product_id where category_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [category_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function getOneProduct(product_id) {
    let sql = `Select * from products left join images
                on products.product_id = images.products_product_id  where products.product_id = ?`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

//Lấy tất cả Products
async function getAllProduct() {
    let sql = `Select * from products
                ORDER BY Rand()`;
    return new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

//Xoá product (Phải xoá products_has_category và images trước)..
function deleteProductsCatagory(product_id) {
    let sql = `delete from products_has_category where products_product_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}
function deleteImages(product_id) {
    let sql = `delete from images where products_product_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}
async function deleteProducts(product_id) {
    deleteProductsCatagory(product_id);
    deleteImages(product_id);
    let sql = `delete from products where product_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function insertProducts(product_name, price, content, status) {
    let sql = `Insert into products (product_name, price, contents, status)
                Values (?, ?, ?, ?)`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_name, price, content, status], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function insertProductsHasCategory(product_id, category_id) {
    let sql = `Insert into products_has_category (products_product_id, category_category_id) 
               Values (?,?)`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [product_id, category_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function insertImage(file_name, products_product_id) {
    let sql = `Insert into images (file_name, products_product_id)
               Values (?,?)`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [file_name, products_product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function updateProduct(product_id, price, content, status) {
    let sql = `Update products
               Set price = ? , contents = ?, updated_at = ?, status = ?
               Where product_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [price, content, new Date(), status, product_id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function getProductswithImages() {
    let sql = `select * from products 
                join images on products.product_id = images.products_product_id
                ORDER BY RAND();`
    return new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

async function getProductswithImagesById(id) {
    let sql = `select * from products left
    join images on products.product_id = images.products_product_id WHERE products.product_id = ?;`
    return new Promise((resolve, reject) => {
        conn.query(sql, [id], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

//Home
async function getSearchProduct(product_name) {
    let sql = `Select * from products inner join images on products.product_id = images.products_product_id 
               Where product_name like ? AND status = 1`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [`%${product_name}%`], (err, result) => {
            try {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            }
            catch (ex) {
                console.log(ex);
                resolve(null);
            }
        })
    })
}

module.exports = {
    getProduct: getProduct,
    getAllProduct: getAllProduct,
    deleteProducts: deleteProducts,
    insertProducts: insertProducts,
    insertProductsHasCategory: insertProductsHasCategory,
    insertImage: insertImage,
    updateProduct: updateProduct,
    getOneProduct: getOneProduct,
    getProductswithImages: getProductswithImages,
    getProductswithImagesById: getProductswithImagesById,
    getSearchProduct: getSearchProduct,
}
