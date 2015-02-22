Meteor.methods
  'addresses.insert': (addressData) ->
    requiredParameters = ['address']
    for field in requiredParameters
      unless addressData[field]?
        throw new Meteor.Error MethodsErrors.noRequiredParams, 'Some required address parameters are not set'
    addressData = _.pick.bind(null, addressData).apply(null, requiredParameters)
    addressData = _.extend addressData,
      manager: Meteor.userId()
      inhabitants: []
    throw new Meteor.Error MethodsErrors.addressExists, 'Such address already exists' if Addresses.findOne address: addressData.address
    Addresses.insert addressData



  'addresses.remove': (id) ->
    address = Addresses.findOne id
    throw new Meteor.Error MethodsErrors.addressDoesNotExist unless address
    throw new Meteor.Error MethodsErrors.notAManager unless Meteor.userId() == address.manager
    throw new Meteor.Error MethodsErrors.inhabitantsAreExist if address.inhabitants.length
    oldId = address._id
    if Meteor.isServer
      address.old_id = address._id
      delete address._id
      ArchivedAddresses.insert address
    Addresses.remove oldId



  'addresses.addInhabitant': (id) ->
    unless Meteor.userId() then throw new Meteor.Error MethodsErrors.notAuthenticated
    unless Addresses.findOne id then throw new Meteor.Error MethodsErrors.addressDoesNotExist
    Addresses.update id, $addToSet: inhabitants: Meteor.userId()



  'addresses.removeInhabitant': (id) ->
    unless Meteor.userId() then throw new Meteor.Error MethodsErrors.notAuthenticated
    unless Addresses.findOne id then throw new Meteor.Error MethodsErrors.addressDoesNotExist
    Addresses.update id, $pull: inhabitants: Meteor.userId()
