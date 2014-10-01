@Apps = new Mongo.Collection "apps"

Apps.before.insert (userId, doc) ->
  doc.createdAtAt = new Date()
  doc.apikey = Random.hexString(20).toLowerCase()

# Apps.allow
#   # insert: (userId, doc) ->
    
#   #   # the user must be logged in, and the document must be owned by the user
#   #   userId and doc.owner is userId

#   update: (userId, doc, fields, modifier) ->
#     console.log "OISVLNFVJLKFJVLKDFK"
#     console.log userId
#     console.log doc.userId    
#     # can only change your own documents
#     doc.userId is userId

#   # remove: (userId, doc) ->
    
#   #   # can only remove your own documents
#   #   doc.owner is userId

#   fetch: ["userId"]
