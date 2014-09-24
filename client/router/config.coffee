Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
  onBeforeAction: ->
    $('meta[name^="description"]').remove()
    

Router.map ->
  @route "home",
    path: "/"
  @route "documentation"
  @route "profile",
    path: "/profile"
    onBeforeAction: ->
      AccountsEntry.signInRequired(this);
  @route "dashboard",
    onBeforeAction: ->
      AccountsEntry.signInRequired(this);