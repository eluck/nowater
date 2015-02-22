Template.event_template.helpers
  dateFromFormatted: ->
    moment(@dateFrom).format("ddd, MMM Do YYYY, h:mm:ss a")

  dateTillFormatted: ->
    moment(@dateTill).format("ddd, MMM Do YYYY, h:mm:ss a")
