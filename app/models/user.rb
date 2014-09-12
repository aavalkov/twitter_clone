class User < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password
  has_many :tweets
  has_many :follows

  def followers
    array = []
    Follow.all.each do |follow|
      if self.id == follow.followed_user_id
        array << follow
      end
    end
      array.count
  end

end
