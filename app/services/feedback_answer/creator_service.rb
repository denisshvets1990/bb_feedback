class FeedbackAnswer::CreatorService
  attr_reader :params, :admin, :feedback, :answer

  def initialize(params:, admin:, feedback:)
    @answer = params[:answer]
    @admin = admin
    @feedback = feedback
  end

  def perform
    return feedback_answer unless feedback_answer.save
    send_notifications
    feedback
  end

  private

  def feedback_answer
    @feedback_answer ||= admin.feedback_answers.new(\
      feedback: feedback,
      answer: answer
    )
  end

  def send_notifications
    ::FeedbackAnswer::SendNotifications.perform_async(feedback_answer.id)
  end
end
