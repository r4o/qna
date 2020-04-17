class Question < ApplicationRecord
  has_many :answers
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :title, :body, presence: true

  accepts_nested_attributes_for :attachments

  after_create :calculate_reputation

  private

  def calculate_reputation
    reputation = Reputation.calculate(self)
    self.user.update(reputation: reputation)
  end
end
