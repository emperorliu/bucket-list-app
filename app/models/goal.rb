class Goal < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :cheers, as: :cheerable

  def total_cheers
   self.cheers.where(cheer:true).size
  end
end