class Question < ApplicationRecord
  has_many :answers
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable

  validates :title, :body, presence: true

  accepts_nested_attributes_for :attachments

  default_scope -> { order :created_at }
end
