@Addresses = new Mongo.Collection('addresses')
@Events = new Mongo.Collection('events')


Addresses.deny
  insert: -> true
  update: -> true
  remove: -> true
