Template.add_event_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    address = $('#address').val()
    return unless address
    sameAddress = Addresses.findOne address: address
    return if sameAddress
    Addresses.insert address: address, manager: Meteor.userId(), inhabitants: []
    $('#address').val('')


  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()



Template.add_event_template.helpers
  addresses: ->
    Addresses.find manager: Meteor.userId()



Template.add_event_template.rendered = ->
  computations = []

  computations.push Tracker.autorun ->
    return unless Addresses.find().count()
    console.log 'add_event_template autoruns'
    $("#select-addresses")[0]?.selectedIndex = 0;

  TrackerHelper.cleanUpComputationsWhenSwitchingFromView computations, 'addEventView'
