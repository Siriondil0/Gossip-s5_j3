class User < ApplicationRecord
  has_and_belongs_to_many :pms, through: :recipients
  belongs_to :city 
end
