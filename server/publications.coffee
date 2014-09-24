Meteor.publish "my-apps", ->
  Apps.find 
  	userId: @userId
  ,
    fields:
      apiKey: 1

