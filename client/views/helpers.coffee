# Template Helpers
UI.registerHelper "apiKey", ->
	console.log "apikey..."
	Apps.findOne().apiKey if Apps.findOne()

UI.registerHelper "flashAlert", (selector, delay) ->
  console.log "flashAlert"
  alert = $(selector).alert()
  Meteor.setTimeout (->
    alert.alert "close"
  ), delay

# Javascript Helpers
window.buttonLoading = (selector, delay) ->
	$(selector).button('loading')

window.buttonHide = (selector, delay) ->
	Meteor.setTimeout (->
		$(selector).button('finished')
	), 1000

window.naturalFlow = (e) ->
	e.preventDefault()
	e.stopPropagation()

# UI.body.events click: ->
