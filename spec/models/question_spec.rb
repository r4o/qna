require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { build(:question) }

  it { should have_many :answers }
  it { should have_many :attachments }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should accept_nested_attributes_for :attachments }

  its(:title) { should == "MyString" }

  it 'should calculate reputation after creating' do
    expect(subject).to receive(:calculate_reputation)
    subject.save!
  end

  it 'should not calculate reputation after update' do
    subject.save!
    expect(subject).to_not receive(:calculate_reputation)
    subject.update(title: '123')
  end
end
