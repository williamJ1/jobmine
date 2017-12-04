class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "Profile"
  belongs_to :actor, class_name: "Profile"
end