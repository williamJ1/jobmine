class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup()

  setup: ->
    console.log("fefeeefefeef")
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    console.log(data)
    items = data.map (notification) ->  "<li class='dropdown-item'> #{notification.actor.email} #{notification.action} </li>"
    console.log(items)
    $("#notification-items").append(items)


jQuery ->
  new Notifications