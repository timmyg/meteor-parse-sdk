# Template.home.rendered = ->

#   #SEO Page Title & Description
#   document.title = "My New Meteor App"
#   $("<meta>", { name: "description", content: "Page description for My New Meteor App" }).appendTo "head"

Template.landing.rendered = ->
	$
Template.landing.events
	"click .early-access-submit": (e, t) ->
		naturalFlow e
		email = $("input#InputEmail").val()
		company = $("input#CompanyName").val()
		unless email and company
			console.log "invalid"
			toastErrorAlert()
			return
		Parse.initialize("nVFEpFpLtDVOHmKhM0KRlJ4xHfToVohUSvGv1u7t", "y6rjPM0J9uLdveGWrnzLVId7grSlWpbHIe4ILiM3");
		Signup = Parse.Object.extend("Signup")
		signup = new Signup()
		signup.set "email", email
		signup.set "company", company
		signup.save null,
			success: (newsignup) ->
				mySignup = newsignup
				console.log "New object created with objectId: " + newsignup.id
				clearForm1()
				$('#signup-modal').modal('show')
			error: (signup, error) ->
				console.log "Failed to create new object, with error code: " + error.message
	
	"click .additional-submit": (e, t) ->
		name = $("input#name").val()
		title = $("input#title").val()
		size = $("input#size").val()
		unless name and title and size
			console.log "invalid"
			toastErrorAlert()
			return
		mySignup.set "name", name
		mySignup.set "title", title
		mySignup.set "size", size
		mySignup.save()			
		$('#signup-modal').modal('hide')
		clearForm2()
		toastThanksAlert()
		console.log "new signup stuff saved"

clearForm1 = ->
	$("input#InputEmail").val("")
	$("input#CompanyName").val("")
clearForm2 = ->
	$("input#name").val("")
	$("input#title").val("")
	$("input#size").val("")

toastThanksAlert = ->
	fadeThanksAlertIn()
	fadeThanksAlertOutTimeout()

fadeThanksAlertIn = ->
	if $(".alert.thanks").hasClass("hide")
		$(".alert.thanks").removeClass("hide")
	else
		$(".alert.thanks").fadeIn()

fadeThanksAlertOutTimeout = ->
	window.setTimeout (->
		$(".alert").fadeOut()
		return
	), 4000

toastErrorAlert = ->
	fadeErrorAlertIn()
	fadeErrorAlertOutTimeout()

fadeErrorAlertIn = ->
	if $(".alert.error").hasClass("hide")
		$(".alert.error").removeClass("hide")
	else
		$(".alert.error").fadeIn()


fadeErrorAlertOutTimeout = ->
	window.setTimeout (->
		$(".alert").fadeOut()
	), 4000