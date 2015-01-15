class IcookRecipe < ActiveRecord::Base
  searchable do
 	text :match_ingredient
    text :title
  	
  	string   :url
    string   :image_url
    string   :description
    string   :ingredient
    string   :step

    # string  :sort_title do
    #   title.downcase.gsub(/^(an?|the)/, '')
    # end
  end
end
