Template.faq.rendered = ->
	$("#affix").affix 
		offset:
			top: 120

# should move this to global
Template.faq.events
	"click a.scroll-to": (e, t) ->
		naturalFlow e
		console.log e.currentTarget.dataset.to
		$("html, body").animate
			scrollTop: $(e.currentTarget.dataset.to).offset().top - 10
		, 500
