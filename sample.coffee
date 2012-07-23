if Meteor.is_server
  Meteor.startup ->
    Meteor.methods(
      {hello: (name) -> "hello #{name}"}
    )

if Meteor.is_client
  Meteor.startup ->
    name = document.getElementById('name')
    $('#button').click =>
      Meteor.call 'hello', name.value, (error, result) ->
        alert(result)
