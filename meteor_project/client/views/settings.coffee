Template.settings_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    addressId = $('#select-addresses').val()
    return unless addressId
    Meteor.call 'addresses.addInhabitant', addressId



  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()



  'click button#deleteFromAddress' : (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    Meteor.call 'addresses.removeInhabitant', @_id




Template.settings_template.helpers
  addresses: ->
    userAddressesIds = Addresses.find(inhabitants : Meteor.userId()).map (address) -> address._id
    Addresses.find _id: $nin: userAddressesIds



  userAddresses: ->
    cur = Addresses.find inhabitants : Meteor.userId()
    return cur
