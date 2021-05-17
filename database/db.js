const sql = require('mssql/msnodesqlv8')

const config = {
  database: 'RcsUsers',
  user: 'scott',
  password: '1',
  server: 'SCOTT-PC',
  driver: 'msnodesqlv8',
  options: {
    trustedConnection: true,    
    instanceName: 'SQLEXPRESS01'
  }
} 
const poolPromise = new sql.ConnectionPool(config)
  .connect()
  .then(pool => {
    console.log('Connected to MSSQL')
    return pool
  })
  .catch(err => console.log('Database Connection Failed! Bad Config: ', err))

module.exports = {
  sql, poolPromise
}