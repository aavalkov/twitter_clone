class User < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password
  has_many :tweets
  has_many :follows

end
