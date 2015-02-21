Meteor.methods
  addEvent: (options) ->
    check options,
      hotColdWater: Match.Where (x) -> x in ['hot', 'cold', 'hot-n-cold']
      dateFrom: Match.Where (x) -> moment(x).isValid()
      dateTill: Match.Where (x) -> moment(x).isValid()
      selectAddresses: Match.Where (x) -> Addresses.findOne _id: x, manager: Meteor.userId()
    if options.dateFrom <= Date.now() then throw new Meteor.Error 'addEvent - dateFrom is not in the future'
    if options.dateTill <= options.dateFrom then throw new Meteor.Error 'addEvent - dateTill is not after dateFrom'
    options.manager = Meteor.userId()
    options.addressString = Addresses.findOne(_id: options.selectAddresses).address
    Events.insert options
