const express = require('express');
const mysql = require('mysql');

//Create connection
const db = mysql.createConnection({
    host        : 'localhost',
    user        : 'root',
    password    : '',
    database    :'urps'
  });


  //Connect
  db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql connected');
  });

const app = express();

/*Create db
app.get('/createdb' , (req, res) => {
    let sql = 'CREATE DATABASE nodemysql';
    db.query(sql, (err, result) => {
        if(err) 
        throw err;
        console.log(result);
        res.send('database created');
    });
});*/

//Create db urps
app.get('/createdb' , (req, res) => {
    let sql = 'CREATE DATABASE urps';
    db.query(sql, (err, result) => {
        if(err) 
        throw err;
        console.log(result);
        res.send('database created');
    });
});

/*Create Table
app.get('/createpoststable', (req, res) => {
    let sql = 'CREATE TABLE posts(id int AUTO_INCREMENT, title VARCHAR(255), body VARCHAR(255), PRIMARY KEY (id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Posts table created');
    });
});*/

//Create Table campus
app.get('/createcampustable', (req, res) => {
    let sql = 'CREATE TABLE campus(id int AUTO_INCREMENT, descption VARCHAR(255), PRIMARY KEY (id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Campus table created');
    });
});

//Create Table Residence
app.get('/createrestable', (req, res) => {
    let sql = 'CREATE TABLE residence(res_id int AUTO_INCREMENT, id int, res_descption VARCHAR(255), PRIMARY KEY (res_id), INDEX camp_camp_index (id), CONSTRAINT camp_id FOREIGN KEY (id) REFERENCES campus(id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Residence table created');
    });
});


//Create Table Committee
app.get('/createcommitteetable', (req, res) => {
    let sql = 'CREATE TABLE committee(com_id int AUTO_INCREMENT, res_id int, committee_descption VARCHAR(255), committee_mark DECIMAL(5), PRIMARY KEY (com_id), INDEX res_res_index (res_id), CONSTRAINT ress_id FOREIGN KEY (res_id) REFERENCES residence(res_id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Committee table created');
    });
});


//Create Table Student
app.get('/createstudenttable', (req, res) => {
    let sql = 'CREATE TABLE student(student_id int AUTO_INCREMENT, res_id int, student_num VARCHAR(255), student_password VARCHAR(255), student_fname VARCHAR(45), student_lnam VARCHAR(45), PRIMARY KEY (student_id), INDEX sres_res_index (res_id), CONSTRAINT sres_id FOREIGN KEY (res_id) REFERENCES residence(res_id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Student table created');
    });
});

//Create Table Event
app.get('/createeventtable', (req, res) => {
    let sql = 'CREATE TABLE event(event_id int AUTO_INCREMENT, com_id int, event_description VARCHAR(255), event_mark DECIMAL(5), event_date DATE , PRIMARY KEY (event_id), INDEX com_com_index (com_id), CONSTRAINT coms_id FOREIGN KEY (com_id) REFERENCES committee(com_id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Event table created');
    });
});


//Create Table Attendance
app.get('/createattendancetable', (req, res) => {
    let sql = 'CREATE TABLE attendance(student_id int, INDEX stu_stu_index (student_id), CONSTRAINT stu_id FOREIGN KEY (student_id) REFERENCES student(student_id), event_id int, INDEX ev_ev_index (event_id), CONSTRAINT ev_id FOREIGN KEY (event_id) REFERENCES event(event_id))';
    db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Attendance table created');
    });
});


/*Insert post 1
app.get('/addpost1', (req, res) => {
    let post = {title:'Post one', body:'This is post num one'};
    let sql = 'INSERT INTO posts SET?';
    let query = db.query(sql, post, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Post 1 added');
    });
});*/

/*Insert post 2
app.get('/addpost2', (req, res) => {
    let post = {title:'Post two', body:'This is post num two'};
    let sql = 'INSERT INTO posts SET?';
    let query = db.query(sql, post, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Post 2 added');
    });
});*/

/*Select posts
app.get('/getposts', (req, res) => {
    let sql = 'SELECT * FROM posts';
    let query = db.query(sql, (err, results) => {
        if(err)
        throw err;
        console.log(results);
        res.send('Posts fetched');
    });
});*/


/*Select single post
app.get('/getpost/:id', (req, res) => {
    let sql = `SELECT * FROM posts WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Post fetched');
    });
});*/


/*Update post
app.get('/updatepost/:id', (req, res) => {
    let newTitle = 'Update Title';
    let sql = `UPDATE posts SET title = '${newTitle}' WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Post updated');
    });
});*/


/*Delete post
app.get('/deletepost/:id', (req, res) => {
    let newTitle = 'Update Title';
    let sql = `DELETE FROM posts WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err)
        throw err;
        console.log(result);
        res.send('Post deleted');
    });
});*/


app.listen('3000', () =>{
    console.log('Server started on port 3000');
});