// TODO google analytics yo!
var app = angular.module('chrisbrown', ['ngRoute']);

app.config(function($routeProvider){
  $routeProvider
    .when('/', {
      templateUrl: 'partials/home.html',
      controller: 'HomeController'
    })
    .when('/resume', {
      templateUrl: 'partials/resume.html',
      controller: 'ResumeController'
    })
    .when('/projects', {
      templateUrl: 'partials/projects.html',
      controller: 'PortfolioController'
    })
    .when('/contact', {
      templateUrl: 'partials/contact.html',
      controller: 'ContactController'
    })

});
