class WantFood < ActiveRecord::Base

	def self.from_wantfood_list(fid)
  		where("uid = :uid", uid: fid)
  	end 

end
