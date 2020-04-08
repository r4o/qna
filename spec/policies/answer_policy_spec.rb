require 'rails_helper'

RSpec.describe AnswerPolicy, type: :policy do
  let(:user) { create :user }

  subject { described_class }

  permissions :update? do
    it 'grants access if user is admin' do
      expect(subject).to permit(User.new(admin:true), create(:answer))
    end

    it 'grant access if user is author' do
      expect(subject).to permit(user, create(:answer, user: user))
    end
  end
end
