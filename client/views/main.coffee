Template.header.rendered = ->
	$(document).on "scroll", ->
		if $(document).scrollTop() > 10
			$(".navbar").removeClass("nav-large").addClass "nav-small"
		else
			$(".navbar").removeClass("nav-small").addClass "nav-large"