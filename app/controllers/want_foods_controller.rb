class WantFoodsController < ApplicationController

	def want_food
    @data = params[:_json]
    @data.each do |d|
      d.each do |key, val|
        WantFood.create(uid: current_user.uid, category: key, name: val )
        Rails.logger.debug("data: #{key} and #{val}")  
      end
      # @food.uid = current_user.uid
    end
    
  	end
end
