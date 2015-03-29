class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :act
      t.string :category

      t.timestamps null: false
    end
  end
end
