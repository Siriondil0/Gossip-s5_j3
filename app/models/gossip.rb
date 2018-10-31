class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
  has_and_belongs_to_many :tags
end
