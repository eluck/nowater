Template.add_event_template.events
  'click button#submitbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    options =
      hotColdWater: $('#hot-cold-water').val()
      dateFrom: $('#date-from').val()
      dateTill: $('#date-till').val()
      selectAddresses: $('#select-addresses').val()
    Meteor.call 'addEvent', options



  'click button#cancelbtn': (event, template) ->
    event.preventDefault()
    event.stopPropagation()
    $('#address').val('').focus()



Template.add_event_template.helpers
  addresses: ->
    Addresses.find manager: Meteor.userId()

  events: ->
    Events.find manager: Meteor.userId()



Template.add_event_template.rendered = ->
  computations = []

  computations.push Tracker.autorun ->
    return unless Addresses.find().count()
    $("#select-addresses")[0]?.selectedIndex = 0;

  TrackerHelper.cleanUpComputationsWhenSwitchingFromView computations, 'addEventView'

  formatted = moment().format('YYYY-MM-DDThh:mm')
  $('#date-from').val formatted
  $('#date-till').val formatted
