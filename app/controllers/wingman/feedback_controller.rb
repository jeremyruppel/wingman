class Wingman::FeedbackController < ActionController::Base

  layout 'wingman'

  def index
  end

  def create
    redirect_to root_path, :notice => 'Thanks for your feedback!'
  end
end
