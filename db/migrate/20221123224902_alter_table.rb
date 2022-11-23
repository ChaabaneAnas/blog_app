class AlterTable < ActiveRecord::Migration[7.0]
  def change
      change_table :users do |c|
        c.change :bio, :text
        c.integer :post_counter
      end
  end
end
