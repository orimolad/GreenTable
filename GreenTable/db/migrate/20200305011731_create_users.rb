class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string 'email', null: false
      t.string 'first_name', null: false
      t.string 'last_name', null: false
      t.string 'phone_number'
      t.string 'display_name'
      t.string 'password_digest', null: false
      t.string 'session_token', null: false
      t.timestamps
    end
    add_index :users, :session_token
  end
end
