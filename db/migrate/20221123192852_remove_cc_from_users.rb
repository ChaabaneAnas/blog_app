class RemoveCcFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :PostCounter, :string
  end
end
