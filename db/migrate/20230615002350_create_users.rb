class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest, allow_nil: false
      t.string :name
      t.timestamps
      t.index "lower(email)", unique: true
    end
  end
end
