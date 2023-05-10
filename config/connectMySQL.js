const mysql = require("mysql2");
class connectMYSQL {
    static conn;
    constructor() {
        if (!this.conn) {
            this.conn = mysql.createConnection({
                host: process.env.DB_HsOST,
                port: process.env.DB_PORT,
                database: process.env.DB_DATABASE,
                user: process.env.DB_USER,
                password: process.env.DB_PASS
            })
            this.conn.connect();
        }
    }
}

module.exports = new connectMYSQL;