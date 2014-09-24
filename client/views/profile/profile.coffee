Template.profile.rendered = ->
	$("#company.editable").editable success: (response, newValue) ->
		# <do something with newValue - usually a collection.update call>
