const chartModal = require("../models/chart.modal");
const categoryModal = require('../models/category.modal');

class Chart {

    async getProductChartToday(req, res, next) {
        let category = await categoryModal.getAllCategory();
        let today = new Date();
        let year = today.getFullYear();
        let month = String(today.getMonth() + 1).padStart(2, '0');
        let day = String(today.getDate()).padStart(2, '0');
        let formattedDate = year + '-' + month + '-' + day;
        //console.log(formattedDate); // ví dụ kết quả: "2022-04-01"

        let productChartToDay = await chartModal.getProductChart(formattedDate);

        res.render("chart", {
            user: req.user,
            category:category,
            productChartToDay: productChartToDay,
        });
    }
    async getProductChart(req, res, next){
        let date = req.query.key
        let productChart = await chartModal.getProductChart(date);
        res.json(productChart);
    }

}

module.exports = new Chart();