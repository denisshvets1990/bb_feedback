class Admin::FeedbacksController < Admin::ApplicationController
  def index
    @feedbacks = FeedbackQuery.new(page: params[:page]).perform
  end

  def show
    @feedback = Feedback.find(params[:id])
  end
end
