var express = require('express');
var logger = require('morgan');

var app = express();
var template = require('jade').compileFile(__dirname + '/source/templates/homepage.jade')
var templatelogin = require('jade').compileFile(__dirname + '/source/templates/login.jade')

app.use(logger('dev'))
app.use(express.static(__dirname + '/static'))

app.get('/web' , function (req, res, next)  {
    try{
        var html = template ({title: 'Home'})
        res.send(html)
        }
    catch(e){
        next(e)
    }
});

app.get('/web/login' , function (req, res, next)  {
    try{
        var html = templatelogin ({title: 'Login'})
        res.send(html)
        }
    catch(e){
        next(e)
    }
});

app.listen(process.env.PORT || 3000, function () {
    console.log('Listening on http://localhost:' + (process.env.PORT || 3000));
});