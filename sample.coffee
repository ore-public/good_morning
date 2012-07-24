HelloMessages = new Meteor.Collection('hello_messages')

if Meteor.is_server
  Meteor.startup ->
    Meteor.methods(
      {hello: (name) -> "hello #{name}"}
    )

if Meteor.is_client
  Template.message_area.messages = ->
    HelloMessages.find({})

  Meteor.startup ->
    name = document.getElementById('name')
    $('#button').click =>
      Meteor.call 'hello', name.value, (error, result) ->
        HelloMessages.insert(message: result)
