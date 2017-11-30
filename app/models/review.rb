class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :name, :category, :content
  validates_presence_of :rating, length: { in: 1..10 }
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end