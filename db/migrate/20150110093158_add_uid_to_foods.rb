class AddUidToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :uid, :string
  end
end
