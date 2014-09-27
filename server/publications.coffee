Meteor.publish "my-apps", ->
  Apps.find 
  	userId: @userId
  ,
    fields:
      apikey: 1
      alertEndpoint: 1

# Apps.allow
#   # insert: (userId, doc) ->
    
#   #   # the user must be logged in, and the document must be owned by the user
#   #   userId and doc.owner is userId

#   update: (userId, doc, fields, modifier) ->
#     true

Apps.allow update: (userId, doc, fieldNames, modifier) ->
  # modifier.$addToSet.upvoterIds is userId
  true
