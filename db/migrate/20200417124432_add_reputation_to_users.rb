class AddReputationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reputation, :integer, default: 0
  end
end
