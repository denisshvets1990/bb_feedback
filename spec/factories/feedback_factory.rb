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

FactoryGirl.define do
  factory :feedback do
    email { Faker::Internet.email }
    question { Faker::Hipster.paragraph }
  end
end
