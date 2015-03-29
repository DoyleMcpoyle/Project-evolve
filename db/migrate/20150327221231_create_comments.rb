class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :category_id

      t.timestamps null: false
    end
  end
end
