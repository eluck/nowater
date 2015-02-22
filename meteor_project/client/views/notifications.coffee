Template.notifications_view.helpers
  events: ->
    addressesIds = Addresses.find(inhabitants: Meteor.userId()).map (address) -> address._id
    Events.find selectAddresses: $in: addressesIds
