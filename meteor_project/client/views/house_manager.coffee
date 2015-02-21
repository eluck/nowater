Template.house_manager_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    address = $('#address').val()
    $('#address').val('')
    return unless address
    Meteor.call 'addresses.insert', address: address, (error, result) ->
      return unless error
      switch error
        when MethodsErrors.noRequiredParams then 'do some fancy action'
        when MethodsErrors.addressExists then 'do some fancy action'



  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()



Template.house_manager_template.helpers
  addresses: ->
    Addresses.find manager: Meteor.userId()



