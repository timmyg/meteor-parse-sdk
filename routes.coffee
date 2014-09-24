Router.map ->
  @route 'home',
    path: '/'

  @route "documentation"

  @route 'dashboard',
    onBeforeAction: ->
      AccountsEntry.signInRequired this

  @route "me",
    # path: "/me"
    data: ->
      Meteor.user()
    onBeforeAction: ->
      AccountsEntry.signInRequired this
    waitOn: ->
      Meteor.subscribe "my-apps"
  # @route "dashboard",
  #   onBeforeAction: ->
  #     AccountsEntry.signInRequired this

  # this needs to be last I think
  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()