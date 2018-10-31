class Pm < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  has_and_belongs_to_many :users
end
