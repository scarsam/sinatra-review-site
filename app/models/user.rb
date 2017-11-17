class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password
  validates_presence_of :name, :email, :password
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end