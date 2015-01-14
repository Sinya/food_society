class CreateIcookRecipes < ActiveRecord::Migration
  def change
    create_table :icook_recipes do |t|
      t.string :url
      t.string :title
      t.string :image_url
      t.string :description
      t.string :ingredient
      t.string :step
      t.string :match_ingredient

      t.timestamps
    end
  end
end
