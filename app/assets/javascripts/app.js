'use strict';

/**
 * @ngdoc overview
 * @name pi1App
 * @description
 * # pi1App
 *
 * Main module of the application.
 */

 var app = angular.module("estilistasDC", ["ngRoute"]);
 app.config(function($routeProvider) {
  $routeProvider
  .when("/", {
    templateUrl : "/main.html"
  })
  .when("/sobreNosotros", {
    templateUrl : "sobreNosotros.html"
  })
  .when("/testimonios", {
    templateUrl : "testimonios.html"
  })
  .when("/contact", {
    templateUrl : "contact.html"
  })
  .when("/login", {
    templateUrl : "login.html"
  })
  .when("/noticias", {
    templateUrl : "noticias.html"
  })
  .when("/registro", {
    templateUrl : "registro.html"
  });
});