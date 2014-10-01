Meteor.startup ->
  Parse.initialize("nVFEpFpLtDVOHmKhM0KRlJ4xHfToVohUSvGv1u7t", "y6rjPM0J9uLdveGWrnzLVId7grSlWpbHIe4ILiM3")
  $('body').attr 'data-spy', 'scroll'
  $('body').attr 'data-target', '#scrollonme'
  # data-spy="scroll" data-target=".navbar-example"

  # for name of Template
  #   Template[name].rendered = templateRendered

  Tracker.autorun ->
    # accounts-entry issue where you have to click login twice
    Router.go "/dashboard" if Meteor.user() and Router.current() and Router.current().path is "/sign-in" # change home to whatever route you want to take the user to after login
    # showOrHideNav(Router.current()) if Router.current() and Router.isStopped

    # to top
    current = Router.current()
    Deps.afterFlush ->
      $(".content-inner").scrollTop 0
      $(window).scrollTop 0
      return

  Accounts.ui.config
    passwordSignupFields: 'EMAIL_ONLY'
    requestPermissions:
      # facebook: ["user_likes"]
      github: [
        "user"
      ]


  AccountsEntry.config
    language: 'en'
    # logo: "logo.png" # if set displays logo above sign-in options
    privacyUrl: "/privacy-policy" # if set adds link to privacy policy and 'you agree to ...' on sign-up page
    termsUrl: "/terms-of-use" # if set adds link to terms  'you agree to ...' on sign-up page
    homeRoute: "/dashboard" # mandatory - path to redirect to after sign-out
    dashboardRoute: "/dashboard" # mandatory - path to redirect to after successful sign-in
    profileRoute: "/profile"
    passwordSignupFields: "EMAIL_ONLY"
    # showSignupCode: true
    showOtherLoginServices: true # Set to false to hide oauth login buttons on the signin/signup pages. Useful if you are using something like accounts-meld or want to oauth for api access
    extraSignUpFields: [ # Add extra signup fields on the signup page
      {
          field: "name" # The database property you want to store the data in
          name: "" # An initial value for the field, if you want one
          label: "Full Name" # The html lable for the field
          placeholder: "" # A placeholder for the field
          type: "text" # The type of field you want
          required: true # Adds html 5 required property if true
      }
      {
          field: "company" # The database property you want to store the data in
          name: "" # An initial value for the field, if you want one
          label: "Company Name" # The html lable for the field
          placeholder: "" # A placeholder for the field
          type: "text" # The type of field you want
          required: true # Adds html 5 required property if true
      }
    ]

# run after each template rendered (possibly multiple times :( )
# Template.rendered = ->
#   console.log "SDKJDKJFJKLLKDJF"
#   console.log this
#   console.log "SDKJDKJFJKLLKDJF"
#   console.log "SDKJDKJFJKLLKDJF"
#   route = Router.current().route.name
#   console.log route
#   if route is "landing"
#     console.log "is landing"
#     $("nav").addClass("hide")
#     $(".page-top-spacing").addClass("hide")
#   else
#     $("nav").removeClass("hide")
#     $(".page-top-spacing").removeClass("hide")


