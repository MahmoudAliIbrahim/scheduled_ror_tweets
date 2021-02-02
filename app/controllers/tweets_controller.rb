class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: %i[edit update destroy]
  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def edit; end

  def update
    redirect_to tweets_path, notice: 'Tweet has updated successfully' if @tweet.update(tweet_params)
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'Your tweet scheduled successfully'
    else
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet was unscheduled'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find_by(id: params[:id])
  end
end
