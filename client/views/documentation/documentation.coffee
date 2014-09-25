Template.documentation.rendered = ->
	$("#affix").affix 
		offset:
			top: 120

Template.documentation.myApiKey = ->
	if Meteor.user()
		return Apps.findOne().apiKey if Apps.findOne()
	else
		return "<YOUR API KEY HERE>"

# should move this to global
Template.documentation.events
	"click a.scroll-to": (e, t) ->
		naturalFlow e
		console.log e.currentTarget.dataset.to
		$("html, body").animate
			scrollTop: $(e.currentTarget.dataset.to).offset().top - 10
		, 500
