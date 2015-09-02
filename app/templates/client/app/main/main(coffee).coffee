'use strict'

angular.module '<%= scriptAppName %>'
<% if (filters.ngroute) { %>.config ($routeProvider) ->
  $routeProvider
  .when '/',
    templateUrl: 'app/main/main.html'
    controller: 'MainController'
    controllerAs: 'main'
<% } %><% if (filters.uirouter) { %>.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainController'
    controllerAs: 'main'
<% } %>
