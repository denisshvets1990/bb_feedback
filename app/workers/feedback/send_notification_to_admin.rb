class Feedback::SendNotificationToAdmin
  include Sidekiq::Worker

  def perform(feedback_id)
    feedback = Feedback.find(feedback_id)
    AdminUser.find_each do |admin|
      AdminMailer.feedback_created(admin: admin, feedback: feedback).deliver
    end
  end
end