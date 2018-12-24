jQuery(document).on 'turbolinks:load', ->
  messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
  messages = $('#conversation-body')

  if $('#current-user').size() > 0
    App.personal_chat = App.cable.subscriptions.create {
      channel: "NotificationsChannel"
    },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when data is received
  if messages.length > 0
     messages_to_bottom()