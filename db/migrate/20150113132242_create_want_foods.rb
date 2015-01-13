class CreateWantFoods < ActiveRecord::Migration
  def change
    create_table :want_foods do |t|
      t.string :name
      t.string :category
      t.string :uid
      t.date :due

      t.timestamps
    end
  end
end
