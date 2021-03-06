class Cheer < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :cheerable, polymorphic: true

  validates_uniqueness_of :creator, scope: [:cheerable_type, :cheerable_id]
end