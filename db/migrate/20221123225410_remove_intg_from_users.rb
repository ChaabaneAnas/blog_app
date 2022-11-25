class RemoveIntgFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :integer, :string
  end
end
