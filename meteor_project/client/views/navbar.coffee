Template.navbar.events
  'click #notificationsView': ->
    Session.set('currentView', 'notificationsView')


  'click #settingsView': ->
    Session.set('currentView', 'settingsView')


  'click #houseManagerView': ->
    Session.set('currentView', 'houseManagerView')


  'click #addEventView': ->
    Session.set('currentView', 'addEventView')
