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


Template.settings_template.helpers
  addr: ->
    position: "bottom",
    limit: 5,
    rules: [
        token: ''
        collection: Addresses
        field: "address"
        filter: inhabitants : $nin : [Meteor.userId()]
        template: Template.addressOption
        callback: (doc, element)->
          #console.log(doc, element)
          Session.set 'selectedAddr',
            addr: doc
    ]


  userAddresses: ->
    cur = Addresses.find inhabitants : Meteor.userId()
    return cur