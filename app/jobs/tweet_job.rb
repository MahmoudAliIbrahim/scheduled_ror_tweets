class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    retrun if tweet.publish_at > Time.Current

    tweet.publish_to_twitter!
  end
end
