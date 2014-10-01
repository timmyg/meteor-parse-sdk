Template.me.rendered = ->
	# console.log "me rendered"

Template.me.app = ->
	Apps.findOne()

Template.me.events
	"click #save": (e, t) ->
		naturalFlow e
		buttonLoading e.target
		Meteor.users.update
			_id: Meteor.userId()
		,
			$set:
				"profile.company": $("input#company").val()
		, (err, success) ->
			Apps.update Apps.findOne()._id,
				$set:
					"alertEndpoint": $("input#alert-endpoint").val()
				, (err, success) ->
					buttonHide e.target
	"click #logout": (e, t) ->
		Meteor.logout()