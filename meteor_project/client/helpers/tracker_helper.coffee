@TrackerHelper =
  cleanUpComputationsWhenSwitchingFromView: (computations, viewName) ->
    computations.push Tracker.autorun ->
      return if Session.equals 'currentView', viewName
      computations.forEach (computation) -> computation.stop()
      computations = []