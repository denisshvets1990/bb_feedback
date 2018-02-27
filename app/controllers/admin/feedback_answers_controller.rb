class Admin::FeedbackAnswersController < Admin::ApplicationController
  before_action :fetch_feedback

  def new
    @answer = FeedbackAnswer.new
  end

  def create
    @answer = ::FeedbackAnswer::CreatorService.new(\
      params: params[:feedback_answer],
      admin: current_admin_user,
      feedback: @feedback
    ).perform

    return render action: :new if @answer.errors.present?

    flash[:success] = I18n.t('feedback_answer.successfully_created')
    redirect_to admin_feedbacks_path
  end

  private

  def fetch_feedback
    @feedback = Feedback.find(params[:feedback_id])
    render_page_not_found if @feedback.feedback_answer.present?
  end
end
