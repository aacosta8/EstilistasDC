'use strict';

/**
 * @ngdoc overview
 * @name pi1App
 * @description
 * # pi1App
 *
 * Main module of the application.
 */

angular.module('pi1App', ['ui.router'])
.config(function ($routeProvider) {
  $routeProvider
  .when('/', {
    templateUrl: '/main.html',
    controller: 'welcome',
    controllerAs: 'welcome'
  })
  .when('/sobreNosotros', {
    templateUrl: 'views/sobreNosotros.html',
    controller: 'SobreNosotrosCtrl',
    controllerAs: 'sobreNosotros'
  })
  .when('/contact', {
    templateUrl: 'views/contact.html',
    controller: 'ContactCtrl',
    controllerAs: 'contact'
  })
  .when('/login', {
    templateUrl: 'views/login.html',
    controller: 'LoginCtrl',
    controllerAs: 'login'
  })
  .when('/testimonios', {
    templateUrl: 'views/testimonios.html',
    controller: 'TestimoniosCtrl',
    controllerAs: 'testimonios'
  })
  .when('/noticias', {
    templateUrl: 'views/noticias.html',
    controller: 'NoticiasCtrl',
    controllerAs: 'noticias'
  })
  .when('/registro', {
    templateUrl: 'views/registro.html',
    controller: 'RegistroCtrl',
    controllerAs: 'registro'
  })
  .otherwise({
    redirectTo: '/'
  });
});