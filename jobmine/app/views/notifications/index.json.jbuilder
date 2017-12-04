json.array! @notifications do |notification|
  json.recipient notification.recipient.user
  json.actor notification.actor.user
  json.action notification.action
end