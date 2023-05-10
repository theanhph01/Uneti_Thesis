const conn = require('../config/connectMySQL').conn;

//Lấy dữ liệu bảng category
function getAllCategory() {
    let sql = `Select * from category`;
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, (err, result) => {
                if (!err) {
                    resolve(result);
                }
                else {
                    throw err;
                }
            })
        }
        catch (ex) {
            console.log(ex);
            resolve(null);
        }
    })
}

//Thêm danh mục
function addCategory(name) {
    let sql = `Insert into category (category_name)
               Values (?)`;
    return new Promise((resolve, reject) => {
        conn.query(sql, [name], (err, result) => {
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

//Xoá category (Phải xoá products_has_category trước)..
function deleteProducts_has_category(category_id) {
    let sql = `delete from products_has_category where category_category_id = ?`
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
async function deleteCategory(category_id) {
    await deleteProducts_has_category(category_id);
    let sql = `Delete from category where category_id = ?`
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

//Sửa
async function updateCategory(category_id, name) {
    let sql = `Update category
               Set category_name = ? , updated_at = ?
               Where category_id = ?`
    return new Promise((resolve, reject) => {
        conn.query(sql, [name,new Date(), category_id], (err, result) => {
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

async function searchCategory(category_id) {
    let sql = `Select * from category 
              left join products_has_category on products_has_category.category_category_id = category.category_id
              left join products on products.product_id = products_has_category.products_product_id
              left join images on products.product_id = images.products_product_id
              where category.category_id = ?`
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



module.exports = {
    getAllCategory: getAllCategory,
    addCategory: addCategory,
    deleteCategory: deleteCategory,
    updateCategory: updateCategory,
    searchCategory: searchCategory,
}

