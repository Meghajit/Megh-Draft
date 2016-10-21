var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var port = process.env.PORT||3000;

var connection=require('./connection');
var routes = require('./routes/index');
var users = require('./routes/users');

var studentLogin=require('./routes/StudentRouter');
var facultyLogin=require('./routes/FacultyRouter');
var stdetRouter=require('./routes/StudentDetailsRouter');
var facdetRouter=require('./routes/FacultyDetailsRouter');
var seeReviewRouter=require('./routes/SeeReviewRouter');
var takeReviewRouter=require('./routes/TakeReviewRouter');

//var department=require('./DepartmentRouter');
//var enrolled=require('./EnrolledRouter');
//var faculty=require('./FacultyRouter');
//var question=require('./routes/QuestionRouter');


var app = express();

connection.init();
app.listen(port, function(){

  console.log(`Server now running at port ${port}/`);
});



// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
app.use('/users', users);
app.use('/login/student',studentLogin);
app.use('/login/faculty',facultyLogin);
app.use('/login/student/StudentDetails', stdetRouter);
app.use('/login/faculty/FacultyDetails',facdetRouter);
//app.use('/admin/question',question);
app.use('/login/student/TakeReview',takeReviewRouter);
app.use('/login/faculty/SeeReview',seeReviewRouter);
//app.use('/department',department);
//app.use('/enrolled',enrolled);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
