class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = ::Feedback::CreatorService.new(params: params[:feedback]).perform
    return render action: :new if @feedback.errors.present?

    flash[:success] = I18n.t('feedback.successfully_created')
    redirect_to new_feedback_path
  end
end
