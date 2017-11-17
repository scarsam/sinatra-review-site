class Review < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :content, :rating
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end