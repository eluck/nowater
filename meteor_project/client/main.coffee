Meteor.startup ->
  Tracker.autorun ->
    Session.set('currentView', 'houseManagerView') unless Meteor.userId()

