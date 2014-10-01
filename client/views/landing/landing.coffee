# Template.home.rendered = ->

#   #SEO Page Title & Description
#   document.title = "My New Meteor App"
#   $("<meta>", { name: "description", content: "Page description for My New Meteor App" }).appendTo "head"
Template.landing.events
	"click .early-access-submit": (e, t) ->
		naturalFlow e
		email = $("input#InputEmail").val()
		company = $("input#CompanyName").val()
		unless email and company
			console.log "invalid"
			toastAlert(".error")
			return
		Signup = Parse.Object.extend("Signup")
		signup = new Signup()
		signup.set "email", email
		signup.set "company", company
		signup.save null,
			success: (newsignup) ->
				@mySignup = newsignup
				console.log "New object created with objectId: " + newsignup.id
				clearForm()
				$('#signup-modal').modal('show')
			error: (signup, error) ->
				console.log "Failed to create new object, with error code: " + error.message
	
Template.modals.events
	"click .additional-submit": (e, t) ->
		name = $("input#name").val()
		title = $("input#title").val()
		size = $("input#size").val()
		unless name and title and size
			console.log "invalid"
			toastAlert(".error")
		mySignup.set "name", name
		mySignup.set "title", title
		mySignup.set "size", size
		mySignup.save null,		
			success: (mySignup) ->
				hideForm("#signup-modal")
				toastAlert(".thanks.signup")

	"click .contact-modal.submit": (e, t) ->
		name = $("#contact-modal #name").val()
		whatup = $("#contact-modal #whatup").val()
		unless name and whatup
			return toastAlert(".error")
		Contact = Parse.Object.extend("ContactUs")
		contact = new Contact()
		contact.set "name", name
		contact.set "whatup", whatup
		console.log "saving contact..."
		contact.save null,
			success: (newsignup) ->
				hideForm("#contact-modal")
				toastAlert(".thanks.contact")


hideForm = (formSelector) ->
	$(formSelector).modal('hide')
	$("#{formSelector} input").val("")

toastAlert = (selector) ->
	$(".alert#{selector}").removeClass("hide")
	window.setTimeout (->
		$(".alert#{selector}").addClass("hide")
	), 4000