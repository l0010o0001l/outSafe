class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :location
      t.string :gender
      t.string :about
      t.boolean :host
      t.boolean :guest
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
