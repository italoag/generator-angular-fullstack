'use strict'

MainController = ($scope, $http<% if (filters.socketio) { %>, socket<% } %>) ->
  @awesomeThings = []
  $http.get('/api/things').then (response) =>
    this.awesomeThings = response.data<% if (filters.socketio) { %>
    socket.syncUpdates 'thing', this.awesomeThings<% } %>
    return
<% if (filters.models) { %>
  @addThing = =>
    if this.newThing == ''
      return
    $http.post '/api/things', name: this.newThing
    this.newThing = ''
    return

  @deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id
    return<% } %><% if (filters.socketio) { %>

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'thing'
    return<% } %>
  return this

angular.module '<%= scriptAppName %>'
.controller 'MainController', MainController
