require 'rails_helper'

RSpec.describe AnswerPolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions :update? do
    it 'grants access if user is admin' do
      expect(subject).to permit(User.new(admin:true), create(:answer))
    end
  end
end
