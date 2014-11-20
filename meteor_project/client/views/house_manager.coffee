Template.house_manager_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    address = $('#address').val()
    return unless address
    sameAddress = Addresses.findOne address: address
    if !sameAddress.manager
      Addresses.update sameAddress._id, $set: manager : Meteor.userId()
    return if sameAddress
    Addresses.insert address: address, manager: Meteor.userId(), inhabitants: []
    $('#address').val('')


  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()



Template.house_manager_template.helpers
  addresses: ->
    Addresses.find manager: Meteor.userId()



Template.address_template.events
  'click .delete': (event, template) ->
    Addresses.update @_id,  $set: manager: null
