const { deleteCategory } = require('../../models/category.modal');
const categoryModal = require('../../models/category.modal');

class Category {
    //-----GET-----
    //Lấy dữ liệu bảng category
    async getAllCategory(req, res, next) {
        let category = await categoryModal.getAllCategory();
        res.render('categories', {
            category: category,
            user: req.user,
        })
    }

    //Thêm category
    async addCategory(req, res, next) {
        let category = await categoryModal.addCategory(req.body.category_name);
        if (category) {
            res.redirect('/categories');
        }
    }

    //Xoá category
    async deleteCategory(req, res, next) {
        let id = req.body.id;
        let category = await categoryModal.deleteCategory(id);
        res.redirect('/categories');
    }

    //Sửa category
    async updateCategory(req, res, next) {
        let id = req.body.id;
        let name = req.body.edit_name;
        let category = await categoryModal.updateCategory(id, name);
        res.redirect('/categories');
    }


};



module.exports = new Category;