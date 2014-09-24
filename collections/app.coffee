@Apps = new Mongo.Collection "apps"

Apps.before.insert (userId, doc) ->
  doc.createdAtAt = new Date()
  doc.apiKey = Random.hexString(20).toLowerCase()