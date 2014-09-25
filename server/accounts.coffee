Meteor.startup ->
    configureEmailServer()
    AccountsEntry.config
        signupCode: null
    Accounts.onCreateUser( (options, user) ->
        options.profile = {} unless options.profile
        options.profile.company = "" unless options.profile.company
        options.profile.name = "" unless options.profile.name
        options.profile.email = user.emails[0].address if user.emails
        user.profile = options.profile if options.profile
        id = Apps.insert({userId: user._id})
        user.apps = [ id ]
        user)

    Accounts.onLogin (info) ->
      # console.log "onLogin!"
      user = info.user
      return unless user.services and user.services.github
      if user
        github = new GitHub(
          version: "3.0.0" # required
          timeout: 5000 # optional
        )
        github.authenticate
          type: "oauth"
          token: user.services.github.accessToken

        try
          result = github.user.getEmails(user: user.services.github.username)
          emails = []
          for email in result
            emails.push email unless email is undefined

          # can't tell which one is the primary from the result :(
          Meteor.users.update
            _id: user._id
          ,
            $set:
              "profile.email": emails[0]
              "profile.username": user.services.github.username
              "services.github.email": emails[0]
              "services.github.emails": emails

        catch e
          console.log e.message

configureEmailServer = ->
  Meteor.startup ->
    smtp =
      username: "postmaster@getvenn.io" # eg: server@gentlenode.com
      password: "orange13" # eg: 3eeP1gtizk5eziohfervU
      server: "smtp.mailgun.org" # eg: mail.gandi.net
      port: 25

    process.env.MAIL_URL = "smtp://#{encodeURIComponent(smtp.username)}:#{encodeURIComponent(smtp.password)}@#{encodeURIComponent(smtp.server)}:#{smtp.port}"
