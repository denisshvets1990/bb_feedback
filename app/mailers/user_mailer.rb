class UserMailer < ApplicationMailer
  def feedback_received_response(email:, feedback_answer:)
    @feedback_answer = feedback_answer
    @feedback = feedback_answer.feedback

    mail to: email, subject: I18n.t('feedback.received_responce')
  end
end
