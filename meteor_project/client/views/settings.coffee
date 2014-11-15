Template.settings_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    address = $('#selectaddress').val()
    return unless address
    Addresses.update address, $addToSet : inhabitants: Meteor.userId()
    $('#address').val('')


  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()

  'click button#deleteFromAddress' : (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    Addresses.update @_id, $pull: inhabitants: Meteor.userId()


Template.settings_template.helpers
  addresses: ->
    Addresses.find inhabitants : $nin : [Meteor.userId()]

  userAddresses: ->
    cur = Addresses.find inhabitants : Meteor.userId()
    return cur
