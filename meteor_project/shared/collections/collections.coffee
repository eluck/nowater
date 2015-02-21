@Addresses = new Mongo.Collection 'addresses'

Addresses.deny
  insert: -> true
  update: -> true
  remove: -> true



@Events = new Mongo.Collection 'events'

Events.deny
  insert: -> true
  update: -> true
  remove: -> true
