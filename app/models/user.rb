class User < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password
  has_many :tweets
  has_many :follows
  has_many :followed_users, :through => :follows
  has_many :f_tweets, :through => :followed_users, :source => :tweets

  def followers
    array = []
    Follow.all.each do |follow|
      if self.id == follow.followed_user_id
        array << follow
      end
    end
    array.count
  end

  def all_followers_tweets
    tweets = []
    self.follows.each do |person|
      user = User.find(person.followed_user_id)
      user.tweets.each do |tweet|
        tweets << tweet
      end
    end
    tweets
  end



    # <% current_user.follows.each do |tweet| %>

    # <%followed_id = tweet.followed_user_id%>
    # <% %>


    # <% tweeter = '@' + User.find(tweet.user_id).username.capitalize%>
    # <%=link_to tweeter, user_path(tweet.user_id)%>

end
