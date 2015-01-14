# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'open-uri'
# 	Ingredient.delete_all
# 	open("#{Rails.root}/ingredients") do |ingredients|
# 		ingredients.read.each_line do |ingredient|
# 		Ingredient.create!(:name => ingredient[0..-2])
# 	end
# end


require 'open-uri'
	IcookRecipe.delete_all
	open("#{Rails.root}/recipes") do |icook_recipes|
		icook_recipes.read.each_line do |icook_recipe|
			icook_recipe = icook_recipe.split(",");
		IcookRecipe.create!(:url => icook_recipe[0], :title => icook_recipe[1], :image_url => icook_recipe[2], :description => icook_recipe[3], :ingredient => icook_recipe[4], :step => icook_recipe[5], :match_ingredient => icook_recipe[6])
	end
end