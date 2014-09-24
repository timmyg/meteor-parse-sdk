Meteor.startup ->
  AccountsEntry.config
    signupCode: null
  Accounts.onCreateUser( (options, user) ->
    console.log "oncreateuser!!!!"
    options.profile = {} unless options.profile
    options.profile.company = "" unless options.profile.company
    options.profile.name = "" unless options.profile.name
    user.profile = options.profile if options.profile
    user)