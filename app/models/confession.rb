class Confession < ActiveRecord::Base
  attr_accessible :content, :number_of_likes, :number_of_dislikes
  validates :content, presence: true

  acts_as_voteable
end
