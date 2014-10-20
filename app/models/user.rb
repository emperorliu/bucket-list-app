class User < ActiveRecord::Base
  include SluggableJeff1

  has_many :goals
  has_many :cheers

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  # valdiates :password, presence: true, on: :create, length: {minimum: 3}

  sluggable_column :username

end