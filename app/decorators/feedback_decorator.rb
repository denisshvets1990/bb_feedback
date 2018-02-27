class FeedbackDecorator < Draper::Decorator
  delegate_all

  def can_answer?
    feedback_answer.blank? && email.present?
  end
end
