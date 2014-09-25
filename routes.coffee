Router.map ->
  @route "documentation",
    waitOn: ->
      Meteor.subscribe "my-apps"

  @route "faq"

  @route '/',
    onBeforeAction: ->
      Router.go('dashboard') if Meteor.user()
      Router.go('/sign-in') unless Meteor.user()

  @route 'dashboard',
    onBeforeAction: ->
      AccountsEntry.signInRequired this

  @route "me",
    data: ->
      Meteor.user()
    onBeforeAction: ->
      AccountsEntry.signInRequired this
    waitOn: ->
      Meteor.subscribe "my-apps"



  # this needs to be last I think
  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()