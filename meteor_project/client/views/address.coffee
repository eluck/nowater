Template.address_template.events
  'click .delete': (event, template) ->
    Meteor.call 'addresses.remove', @_id, (error, result) ->
      return unless error
      switch error
        when MethodsErrors.addressDoesNotExist then 'do some fancy action'
        when MethodsErrors.notAManager then 'do some fancy action'
