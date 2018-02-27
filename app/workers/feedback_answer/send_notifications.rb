class FeedbackAnswer::SendNotifications
  include Sidekiq::Worker

  def perform(answer_id)
    answer = FeedbackAnswer.find(answer_id)
    feedback = answer.feedback
    return if feedback.blank?

    AdminUser.find_each do |admin|
      AdminMailer.feedback_answer_created(admin: admin, answer: answer).deliver
    end

    return if feedback.email.blank?
    UserMailer.feedback_received_response(
      email: feedback.email,
      feedback_answer: answer
    ).deliver
  end
end