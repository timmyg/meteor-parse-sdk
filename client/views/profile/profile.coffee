Template.me.rendered = ->
	# console.log "me rendered"

Template.me.events
	"click #save": (e, t) ->
		naturalFlow e
		buttonLoading e.target
		Meteor.users.update
			_id: Meteor.userId()
		,
			$set:
				"profile.company": $("input#company").val()
				"profile.alertEndpoint": $("input#alert-endpoint").val()
		, (err, success) ->
			buttonHide e.target
	"click #logout": (e, t) ->
		Meteor.logout()