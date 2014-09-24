class @User extends Minimongoid

  @_collection: Meteor.users

  @current: ->
    if Meteor.userId()
      User.init Meteor.user()

  @before_create: (attr) ->
    console.log "before user create"
    console.log attr
    attr.name = _.titleize(attr.name)
    attr
