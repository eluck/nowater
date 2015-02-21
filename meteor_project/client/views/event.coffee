Template.event_template.helpers
  dateFromFormatted: ->
    Date(@dateFrom).toLocaleString()

  dateTillFormatted: ->
    Date(@dateTill).toLocaleString()
