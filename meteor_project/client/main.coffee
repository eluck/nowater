Meteor.startup ->
#  Meteor.typeahead.inject('.typeahead')
  Tracker.autorun ->
    Session.set('currentView', 'houseManagerView') unless Meteor.userId()

