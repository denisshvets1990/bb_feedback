class AdminMailer < ApplicationMailer
  def feedback_created(admin:, feedback:)
    @feedback = feedback
    mail to: admin.email, subject: I18n.t('feedback.has_been_created')
  end

  def feedback_answer_created(admin:, answer:)
    @answer = answer
    @feedback = answer.feedback
    mail to: admin.email, subject: I18n.t('feedback_answer.has_been_created')
  end
end
