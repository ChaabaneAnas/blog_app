class RemovePcFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postscounter, :string
  end
end
class RemoveFromPcToUsers < ActiveRecord::Migration[7.0]
  def change
  end
end