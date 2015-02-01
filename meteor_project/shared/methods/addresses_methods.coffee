Meteor.methods
  'addresses.insert': (addressData) ->
    requiredParameters = ['address']
    for field in requiredParameters
      throw new Meteor.Error 'no required params', 'Some required address parameters are not set' unless addressData[field]?
    addressData = _.pick.bind(null, addressData).apply(null, requiredParameters)
    addressData = _.extend addressData,
      manager: Meteor.userId()
      inhabitants: []
    throw new Meteor.Error 'address exists', 'Such address already exists' if Addresses.findOne address: addressData.address
    Addresses.insert addressData

