class Wingman::FeedbackController < ActionController::Base

  layout 'wingman'

  def index
  end

  def create
    feedback = Wingman::Feedback.new params[ :feedback ]
    if feedback.valid?
      redirect_to root_path, :notice => 'Thanks for your feedback!'
    else
      redirect_to root_path, :alert => 'Oops! Error message here!'
    end
  end
end
