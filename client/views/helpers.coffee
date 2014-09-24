UI.registerHelper "apiKey", ->
	Apps.findOne().apiKey if Apps.findOne()

UI.registerHelper "flashAlert", (selector, delay) ->
  console.log "flashAlert"
  alert = $(selector).alert()
  Meteor.setTimeout (->
    alert.alert "close"
  ), delay
