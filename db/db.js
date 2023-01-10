const mysql = require('mysql2')

const mySqlConnection = mysql.createConnection({
  port: 3306,
  host: process.env.host,
  user: process.env.user,
  password: process.env.password,
  database: process.env.database
});

mySqlConnection.connect((err) => {
  if (err) throw err;
  console.log("Database Connected!");
});

module.exports = mySqlConnection;