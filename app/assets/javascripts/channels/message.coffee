App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    @joinChannel()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $("#messages").append('<p>' + data.message + '</p>')

  joinChannel: ->
    if channelId = $("#messages").data("channel-id")
      @perform "join_channel", channel_id: channelId
    else
      @perform "leave"
