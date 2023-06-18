class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.belongs_to :users, foreign_key: true, index: true
      t.string :main_text, allow_nil: false
      t.string :short_text, allow_nil: false
      t.timestamps
    end
  end
end
