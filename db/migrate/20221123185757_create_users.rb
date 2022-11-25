class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.string :bio
      t.string :photo
      t.string :postscounter
      t.string :integer

      t.timestamps
    end
  end
end
