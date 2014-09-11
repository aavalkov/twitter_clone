class Tweet < ActiveRecord::Base
  validates_presence_of :tweet
  belongs_to :user

  after_create :check_for_mentions

  def check_for_mentions
    User.all.each do |user|
      if self.tweet.include?("@"+user.username)
        UserMailer.mention(user, self.user.username).deliver
      end
    end
  end
end
