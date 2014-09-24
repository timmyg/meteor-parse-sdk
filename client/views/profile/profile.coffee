Template.me.rendered = ->
	# console.log "me rendered"

Template.me.events
	"click #save": (e, t) ->
		e.preventDefault()
		e.stopPropagation()
		console.log e
		$(e.target).button('loading')
		Meteor.users.update
			_id: Meteor.userId()
		,
			$set:
				"profile.company": $("input#company").val()
		, (err, success) ->
			$(e.target).button('reset')