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
    items = data.map (notification) ->  "<a class='dropdown-item' href='#'>#{notification.actor.email} #{notification.action} </a>"
    console.log(items)
    $("#notification-items").append(items)


jQuery ->
  new Notifications