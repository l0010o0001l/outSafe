class CreatePartiesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :parties_users, id: false do |t|
      t.integer :party_id
      t.integer :user_id
    end

    add_index :parties_users, :party_id
    add_index :parties_users, :user_id
  end
end
