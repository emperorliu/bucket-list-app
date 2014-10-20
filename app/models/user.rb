class User < ActiveRecord::Base  
  has_many :goals
  has_many :cheers

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  # valdiates :password, presence: true, on: :create, length: {minimum: 3}
end