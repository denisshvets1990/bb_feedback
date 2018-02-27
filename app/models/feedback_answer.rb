# == Schema Information
#
# Table name: feedback_answers
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  feedback_id   :integer
#  answer        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FeedbackAnswer < ActiveRecord::Base
  belongs_to :feedback, required: true
  belongs_to :admin_user, required: true

  validates :answer, presence: true
  validates :feedback_id, uniqueness: true
end
