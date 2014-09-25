# Template Helpers
UI.registerHelper "generalName", ->
	Meteor.user().profile.company || Meteor.user().profile.username || Meteor.user().profile.email
UI.registerHelper "apiKey", ->
	Apps.findOne().apiKey if Apps.findOne()

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
