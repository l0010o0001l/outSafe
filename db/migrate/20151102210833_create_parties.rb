class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :description
      t.string :address
      t.integer :min_age

      t.timestamps null: false
    end
  end
end
