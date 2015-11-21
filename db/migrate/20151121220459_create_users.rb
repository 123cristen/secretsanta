class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    add_column :groups, :password_digest, :string
    add_column :groups, :num_users, :int
    add_column :groups, :name, :string
  end
end
