const express = require('express')

const bodyParser = require('body-parser')
const cors = require('cors')
const fs = require('fs')
const path = require('path')
const morgan = require('morgan')
const router = require('./routes/route')
var app = express();

const swaggerUi = require('swagger-ui-express'),
    swaggerDocument = require('./swagger.json');
app.use(cors());
app.options('*', cors())
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())
app.use(morgan('dev'))

// create a write stream (in append mode)
var accessLogStream = fs.createWriteStream(path.join(__dirname, '/logs/access.log'), { flags: 'a' })

// setup the logger
app.use(morgan('combined', { stream: accessLogStream }))

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/api', router);
app.use('/', function(req, res) {
    res.send('home page');
})

app.use((req,res) => {
    res.status(404);
    res.json( {
        error: { code: 404 }
    });
});

const port = process.env.SERVER_PORT || 3000

app.listen(process.env.PORT || port, (err) => {
    if (err)
        console.log('Unable to start the server!')
    else
        console.log('Server started running on : ' + port)
})