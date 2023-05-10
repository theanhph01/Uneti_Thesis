const express = require('express'); //Khai báo thư viện Express
const app = express();
const {createServer} = require("http");
const {Server} = require("socket.io");
// const multer = require("multer");
// const upload = multer({dest: "./public/upload"})

require("dotenv").config();

app.set('view engine', 'ejs'); //Sử dụng view engine -> 'ejs'
app.use('/public', express.static(__dirname + '/public'));

// app.use(upload.any());

const { urlencoded } = require('body-parser'); //Lấy dữ liệu dưới dạng 'post'
const { Socket } = require('dgram');
app.use(urlencoded({ extended: true }));
app.use(require('cookie-parser')());
app.use(require("../project/middleware/passport"))
app.use(require("./routers/index"));

const port = process.env.PORT||3000
const httpServer = createServer(app);

//Chat
const io = new Server(httpServer);
var user = new Map();
const jwt = require("jsonwebtoken");
io.on("connection", (socket)=> {
    // console.log("ket noi " + socket.id);
    
    socket.on("user", (message)=> {
        if(message.token != "" && message.token)
        try {
            let decode = jwt.verify(message.token.split('=')[1], process.env.SECRET_KEY_JWT);
            user.set(decode.id , socket.id);
            // console.log(user);
        } catch (ex) {
            
        }
    })
    socket.on("message", (message)=> {
        if(message.sendTo) {
            io.to(`${user.get(message.sendTo)}`).emit('get_message', {message: message.message});
        }
        else {
            //console.log(message)
            let idSocketAdmin = user.get(39);
            for (const x of user) {
                if(x[1] == socket.id) 
                {
                    io.to(`${idSocketAdmin}`).emit("get_message", {message: message.message, send: x[0]})
                }
            }
        }
    })

})



httpServer.listen(port);
// app.listen(port, (err)=>{
//     if(!err){
//         console.log(`Connect ${port} successful`);
//     }
// })

// const mysql = require('mysql2'); // Khai báo thư viện Mysql2
// const conn = mysql.createConnection({
//     host: '127.0.0.1',
//     port: '3307',
//     database: 'uneti_ecommerce',
//     user: 'root',
//     password: ''
// });
// conn.connect((err) => {
//     if (!err) {
//         console.log('Successful Connection');
//     } else {
//         console.log('%cConnection failed',);
//     }
// });



//Dùng thư viện crypto để băm mật khẩu
// const cypto_pass = require('crypto-js/sha256');
// const SHA256 = require('crypto-js/sha256');

//Login
// app.get('/login', (req, res, next)=>{
//     res.render('login');
// });
// app.post('/login', (req, res,next)=>{
//     let sql = "select * from users where user_name = ? and password = ?";
//     conn.query(sql, [req.body.username, SHA256(req.body.password).toString()], (err, result)=>{
//         if(!err){
//             if(result.length > 0){ //result la 1 mang chua cac Object
//             res.cookie("username"/*ten cua cookie*/, result[0].user_name/*gia tri cookies*/);
//             res.cookie("role", result[0].user_role);
//             res.redirect("/login");
//             }
//             else{
//                 res.render('login', {
//                     message: 'Mật khẩu hoặc tài khoản không đúng'
//                 })
//             }
//         }
//     })
// });

// //Sign-up
// app.get('/sign-up', (req, res, next)=>{
//     res.render('signup');
// })
// app.post('/sign-up', (req,res,next)=>{
//     let sql = "Insert into users(user_name, password, email) values(?, ?, ?)";
//     if(SHA256(req.body.password1).toString() == SHA256(req.body.password2).toString()){
//         conn.query(sql, [req.body.user_name, SHA256(req.body.password1).toString(), req.body.email], (err, result)=>{
//             if(!err){
//                 if(result){
//                     res.redirect('login');
//                     let sql = `Insert into profiles(users_user_id, fullname, date_of_birth, phone_number, job, gender)
//                     values(?, ?, ?, ?, ?, ?)`;
//                     conn.query(sql, [result.insertId ,req.body.fullname, 
//                         req.body.birthday, req.body.phone_number, req.body.phone_number, 
//                         req.body.gender], (err, result)=>{
                            
//                     })
//                 }
//             }
//             console.log(err);
//             console.log(result);
//         });
//     }
//     else{
//         res.render('signup', {
//             message: 'Mật khẩu không trùng khớp'
//         })
//     }
// })

// //Forgot-password
// app.get('/forgot-password', (req,res,next)=>{
//     res.render('forgot-pass');
// })
// app.post('/forgot-password', (req,res,next)=>{
//     let sql = "Select * from users where user_name = ? and email = ?";
//     conn.query(sql, [req.body.user_name, req.body.email], (err, result)=>{
//         if(!err){
//             // let show_div_pass = document.querySelector('#show_div_pass');
//             // let show_btnChangeP = document.querySelector('#change_password');
//             // let hide_btnConfirmP = document.querySelector('#confirm');
//             // show_div_pass.addEventListener('click', () =>{
//             //     div.style.display = "block";
//             // })
//             // show_btnChangeP.addEventListener('click', () =>{
//             //     div.style.display = "block";
//             // })
//             // hide_btnConfirmP.addEventListener('click', () =>{
//             //     div.style.display = "none";
//             // })
//             if(result){
//                 if(req.body.password1 == req.body.password2){
//                     let sql = `Update users
//                                Set password = ?
//                                Where user_id = ?`;
//                     conn.query(sql, [SHA256(req.body.password1).toString(), result[0].user_id]);
//                 }
//                 else{
//                     res.render('signup', {
//                         message: 'Mật khẩu không trùng khớp'
//                     })
//                 }
//             }
//         }
//     })
// })

// //Add Products
// app.get('/add-products', (req, res, next)=>{
//     res.render('add-products');
// })