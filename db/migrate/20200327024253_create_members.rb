class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :members, :email, unique: true
  end
end
