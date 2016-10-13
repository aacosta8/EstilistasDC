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
    templateUrl : "main.html"
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
  })
  .when("/inicioest", {
    templateUrl : "inicioest.html"
  })
  .when("estilistas/perfilest", {
    templateUrl : "perfilest.html"
  })
  .when("estilistas/cortesest", {
    templateUrl : "cortesest.html"
  })
  .when("estilistas/agendaest", {
    templateUrl : "agendaest.html"
  })
  .when("estilistas/citaspest", {
    templateUrl : "citaspest.html"
  })
  .when("estilistas/pubexpest", {
    templateUrl : "pubexpest.html"
  })
  .when("estilistas/verexpest", {
    templateUrl : "verexpest.html"
  });
});