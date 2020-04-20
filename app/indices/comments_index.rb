ThinkingSphinx::Index.define :comment, with: :active_record do
  # fields
  indexes body
  indexes user_id, as: :author

  # attributes
  has user_id, created_at, updated_at
end