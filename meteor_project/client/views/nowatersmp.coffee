Template.layout.helpers
  loggedIn: ->
    Boolean Meteor.userId()


  notificationsView: ->
    Session.equals('currentView', 'notificationsView')


  settingsView: ->
    Session.equals('currentView', 'settingsView')


  houseManagerView: ->
    Session.equals('currentView', 'houseManagerView')


  sendNotificationsView: ->
    Session.equals('currentView', 'sendNotificationsView')
