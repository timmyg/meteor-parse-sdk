Template.me.rendered = ->
	console.log "me rendered"

Template.me.email = ->
	Meteor.user().emails[0].address if Meteor.user()