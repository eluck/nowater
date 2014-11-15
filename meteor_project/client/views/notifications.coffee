Template.notifications_view.helpers
  events: ->

  addresses: ->
    address = Addresses.find inhabitants : Meteor.userId()

