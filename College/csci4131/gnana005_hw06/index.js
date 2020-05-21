// YOU CAN USE THIS FILE AS REFERENCE FOR SERVER DEVELOPMENT

// include the express module
var express = require("express");

// create an express application
var app = express();

// helps in extracting the body portion of an incoming request stream
var bodyparser = require('body-parser');

// fs module - provides an API for interacting with the file system
var fs = require("fs");

// helps in managing user sessions
var session = require('express-session');

// native js function for hashing messages with the SHA-256 algorithm
var crypto = require('crypto');

// include the mysql module
var mysql = require("mysql");

// apply the body-parser middleware to all incoming requests
app.use(bodyparser());

app.use(bodyparser.urlencoded({extended : true}));
app.use(bodyparser.json());

// in mremory session is sufficient for this assignment
app.use(session({
  secret: "csci4131secretkey",
  saveUninitialized: true,
  resave: false}
));

var con = mysql.createConnection({
  host: "cse-larry.cse.umn.edu",
  user: "C4131S20U39", // replace with the database user provided to you
  password: "1551", // replace with the database password provided to you
  database: "C4131S20U39", // replace with the database user provided to you
  port: 3306
});

// server listens on port 9007 for incoming connections
app.listen(8005, () => console.log('Listening on port 8005!'));

app.get('/',function(req, res) {
	res.sendFile(__dirname + '/client/welcome.html');
  req.session.value = 1;
});

app.get('/index',function(req, res) {
	res.sendFile(__dirname + '/client/welcome.html');
});

// // GET method route for the contact page.
// It serves contact.html present in client folder
app.get('/contact',function(req, res) {
  if (req.session.value != 0){
    res.redirect("/login");
  }
  else{
    res.sendFile(__dirname + '/client/contact.html');
  }
});

// GET method route for the addContact page.
// It serves addContact.html present in client folder
app.get('/addContact',function(req, res) {
  if (req.session.value != 0){
    res.redirect("/login");
  }
  else{
    res.sendFile(__dirname + '/client/addContact.html');
  }
});

app.get('/getFlag',function(req, res) {
  if (req.session.value == 1){
    returnObj= {
      error : req.session.value
    };
    var myJSON = JSON.stringify(returnObj);
    res.send(myJSON);
    return;
  }
  else if(req.session.value == 2){
    returnObj= {
      error : req.session.value
    };
    var myJSON = JSON.stringify(returnObj);
    res.send(myJSON);
    return;
  }
  else{
    res.sendFile(__dirname + '/client/contact.html');
  }
});

//GET method for stock page
app.get('/stock', function (req, res) {
  if (req.session.value != 0){
    res.redirect("/login");
  }
  else{
    res.sendFile(__dirname + '/client/stock.html');
  }
});

// GET method route for the login page.
// It serves login.html present in client folder
app.get('/login',function(req, res) {
  if (req.session.value != 0){
    res.sendFile(__dirname + '/client/login.html');
  }
  else{
    res.sendFile(__dirname + '/client/contact.html');
  }
});

app.get('/logout.png',function(req, res) {
  res.sendFile(__dirname + '/client/logout.png');
});

// GET method to return the list of contacts
// The function queries the tbl_contacts table for the list of contacts and
// sends the response back to client

app.get('/getListOfContacts', function(req, res) {
    con.query('SELECT * from tbl_contacts', function(err, result, fields) {
      if(err) {
        throw err;
      }

      if (result.length == 0){
        //req.session.error = 1;
    		var obj = {
          contact : []
        }
      }
      else {
        contactArray = [];

        for (var i = 0 ; i < result.length; i++){
          var obj = {};
          name = result[i].contact_name;
          email = result[i].contact_email;
          address = result[i].contact_address;
          phoneNumber = result[i].contact_phone;
          favoritePlace = result[i].contact_favoriteplace;
          favoritePlaceURL = result[i].contact_favoriteplaceurl;

          obj = {name, email, address, phoneNumber, favoritePlace, favoritePlaceURL};
          contactArray.push(obj);
        }

        returnObj= {
          contact : contactArray
        };

        var myJSON = JSON.stringify(returnObj);
        res.send(myJSON);
        return;
      }
    });
});

// POST method to insert details of a new contact to tbl_contacts table
app.post('/postContact', function(req, res) {
  var contactName = req.body.contactName;
  var email = req.body.email;
  var address = req.body.address;
  var phoneNumber = req.body.phoneNumber;
  var favoritePlace = req.body.favoritePlace;
  var favoritePlaceURL = req.body.favoritePlaceURL;

  var rowToBeInserted = {
      contact_name : contactName,
      contact_email : email,
      contact_address : address,
      contact_phone : phoneNumber,
      contact_favoriteplace : favoritePlace,
      contact_favoriteplaceurl : favoritePlaceURL
    };

    con.query('INSERT tbl_contacts SET ?', rowToBeInserted, function(err, result) {
      if(err) {
        throw err;
      }
      console.log("Value inserted");
      res.redirect("/contact");
    });
});

// POST method to validate user login
// upon successful login, user session is created
app.post('/sendLoginDetails', function(req, res) {
  var username = req.body.username;
	var password = req.body.password;
	if (username && password) {
		con.query('SELECT * FROM  tbl_accounts',
    function(error, results, fields) {

      if (error) {
        throw error;
      }

    	if (results.length == 0){
        //req.session.error = 1;
    		res.redirect("/login");
        return;
      }

    	else {
    		for (var i = 0 ; i < results.length; i++){
    			if((results[i].acc_login == username) && (results[i].acc_password ==
          crypto.createHash("sha256").update(password).digest("base64"))) {
            req.session.value = 0;
            res.redirect("/contact");
          }
          else{
            req.session.value = 2;
            res.redirect("/login");
          }
        }
      }
    });
  }
});

// log out of the application
// destroy user session
app.get('/logout', function(req, res) {
    req.session.value = 1;
    res.sendFile(__dirname + '/client/login.html');
});

// middle ware to serve static files
app.use('/client', express.static(__dirname + '/client'));

// function to return the 404 message and error to client
app.get('*', function(req, res) {
  res.status(404);
  res.send('404: NOT FOUND');
});
