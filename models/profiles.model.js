const conn = require('../config/connectMySQL').conn;

function creatProfile(fullname, phonenumber, dateOfBirth, gender, job, user_id){
    let sql = `Insert into profiles (fullname, date_of_birth, phone_number, gender, job, users_user_id)
                values(?, ?, ?, ?, ?, ?)`;
    return new Promise((resolve, reject)=>{
        try{
            conn.query(sql, [fullname, dateOfBirth, phonenumber, gender, job, user_id], (err, result)=>{
                if(!err){
                    resolve(result);
                }
                else{
                    throw err;
                }
            })
        }
        catch(ex){
            console.log(ex);
            resolve(null);
        }
    })
}


//UpdateProfile
function updateProfile(user_id, email, fullname, address, date_of_birth, phone_number, gender, avt) {
    let sql = `UPDATE profiles
                JOIN users ON profiles.users_user_id = users.user_id
                SET users.email = ?, profiles.fullname = ?, profiles.address = ?, profiles.date_of_birth = ?, profiles.phone_number = ?, 
                profiles.gender = ?, profiles.updated_at = ?, profiles.avatar = ?
               Where users.user_id = ?` 
    return new Promise((resolve, reject) => {
        try {
            conn.query(sql, [email, fullname, address, date_of_birth, phone_number, gender, new Date(), avt ,user_id], (err, result) => {
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
    creat: creatProfile,
    updateProfile: updateProfile,
}