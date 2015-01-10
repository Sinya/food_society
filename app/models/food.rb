class Food < ActiveRecord::Base

	def self.from_food_list(user)
  		where("uid = :uid", uid: user.uid)
  	end 

end
