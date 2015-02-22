Template.settings_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    addressId = $('#select-addresses').val()
    Meteor.call 'addresses.addInhabitant', addressId


  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()

  'click button#deleteFromAddress' : (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    Addresses.update @_id, $pull: inhabitants: Meteor.userId()

  'typeahead:selected': (obj, datum)->
    console.log obj, datum




Template.settings_template.helpers
  addresses: ->
    userAddressesIds = Addresses.find(inhabitants : Meteor.userId()).map (address) -> address._id
    Addresses.find _id: $nin: userAddressesIds



  userAddresses: ->
    cur = Addresses.find inhabitants : Meteor.userId()
    return cur
