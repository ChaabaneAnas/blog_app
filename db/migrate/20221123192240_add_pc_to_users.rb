class AddPcToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :PostCounter, :string
  end
end
