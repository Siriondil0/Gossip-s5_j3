class User < ApplicationRecord
  has_and_belongs_to_many :pms, through: :recipients
  belongs_to :city 

  #validates :first_name, presence: { message: 'ne doit pas être vide'}
  #validates :last_name, presence: { message: 'ne doit pas être vide'}
  #validates :email, presence: { message: 'ne doit pas être vide'}
  #validates :password, presence: { message: 'ne doit pas être vide'}
end
