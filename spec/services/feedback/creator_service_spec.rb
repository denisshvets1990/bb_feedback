require 'rails_helper'

describe Feedback::CreatorService do
  let(:email) { Faker::Internet.email }
  let(:question) { Faker::Hipster.paragraph }
  let(:params) { { email: email, question: question } }
  let(:instance) { described_class.new(params: params) }

  describe 'service create feedback' do
    let(:balance) { 500 }

    subject { instance.perform }

    context 'is valid and create feedback' do
      it { expect { subject }.to(change { Feedback.count }) }
      it { expect { subject }.to(change(Feedback::SendNotificationToAdmin.jobs, :size).by(1)) }
    end

    context 'email is blank' do
      let(:email) { nil }

      it { expect { subject }.to(change { Feedback.count }) }
      it { expect { subject }.to(change(Feedback::SendNotificationToAdmin.jobs, :size).by(1)) }
    end

    context 'email is invalid' do
      let(:email) { Faker::Hipster.name }

      it { expect { subject }.not_to(change { Feedback.count }) }
      it { expect { subject }.not_to(change(Feedback::SendNotificationToAdmin.jobs, :size)) }
    end

    context 'question is blank' do
      let(:question) { nil }

      it { expect { subject }.not_to(change { Feedback.count }) }
      it { expect { subject }.not_to(change(Feedback::SendNotificationToAdmin.jobs, :size)) }
    end
  end
end
