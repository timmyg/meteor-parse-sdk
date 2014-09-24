class @Organization extends Minimongoid

  @_collection: new Meteor.Collection('organizations')

  @current: ->
    if Meteor.userId()
      User.init Meteor.user()

