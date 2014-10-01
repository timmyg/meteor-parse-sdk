Template.documentation.holla = ->
	console.log "hoollllla"
Template.documentation.rendered = ->
	console.log "doc rendered"
	$("#affix").affix 
		offset:
			top: 120
	$("#email-tabs a").click (e) ->
		e.preventDefault()
		$(this).tab "show"

Template.documentation.myApiKey = ->
	if Meteor.user()
		return Apps.findOne().apikey if Apps.findOne()
	else
		return "<YOUR API KEY HERE>"

# should move this to global
Template.documentation.events
	"click a.scroll-to": (e, t) ->
		naturalFlow e
		console.log e.currentTarget.dataset.to
		$("html, body").animate
			scrollTop: $(e.currentTarget.dataset.to).offset().top - 75
		, 500
