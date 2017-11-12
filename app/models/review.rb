class Review < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :content, :rating
end