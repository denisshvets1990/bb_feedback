class Feedback::CreatorService
  attr_reader :email, :question

  def initialize(params:)
    @email = params[:email]
    @question = params[:question]
  end

  def perform
    return feedback unless feedback.save
    send_notification_to_admin
    feedback
  end

  private

  def feedback
    @feedback ||= Feedback.new(\
      email: email,
      question: question
    )
  end

  def send_notification_to_admin
    Feedback::SendNotificationToAdmin.perform_async(feedback.id)
  end
end
