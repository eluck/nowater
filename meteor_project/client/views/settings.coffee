Template.settings_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    #address = $('#selectaddress').val()
    address = Session.get 'selectedAddr'
    return unless address.addr?
    Addresses.update address.addr._id, $addToSet : inhabitants: Meteor.userId()
    $('input#addrsearch').val('')


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


Template.settings_template.rendered = ()->
  Meteor.typeahead.inject('.typeahead')
  return

Template.settings_template.helpers
  addr_old: ->
    position: "bottom",
    limit: 5,
    rules: [
        token: ''
        collection: Addresses
        field: "address"
        filter: inhabitants : $nin : [Meteor.userId()]
        template: Template.addressOption
        callback: (doc, element)->
          Session.set 'selectedAddr',
            addr: doc
    ]


  addr_search : (query, callback)->
    console.log 'addr2 called', query, query.length, query.length < 3
    #if query.length < 3
    return unless query.length >= 3
    Meteor.call 'kladr_street_search', query, {}, (err, res)->
      console.log err, res
      if err
        console.log err
        return
      callback res.data.result.map (it)->
        value : "#{it.typeShort}. #{it.name}"

  addr_selected : (obj, datum) ->
    console.log(obj, datum)

  userAddresses: ->
    cur = Addresses.find inhabitants : Meteor.userId()
    return cur

Meteor.startup ->
  #console.log 'meteor startuped'
  #Meteor.typeahead.inject('.typeahead')
  #console.log $('.typeahead').length