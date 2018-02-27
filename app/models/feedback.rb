# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  email      :string
#  question   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ActiveRecord::Base
  has_one :feedback_answer, dependent: :destroy

  validates :email, email: true, allow_blank: true
  validates :question, presence: true
end
