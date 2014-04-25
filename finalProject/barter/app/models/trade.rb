class Trade < ActiveRecord::Base
	def usersAreDifferent
		if user1 == user2
			error.add(:user2, "cannot be the same as user1")
		end
	end

	def itemsAreDifferent
		if user1_item == user2_item	
			error.add(:user2_item, "cannot be the same item as user1_item aka you can't trade for the same item.")
		end
	end
	validate :usersAreDifferent, :itemsAreDifferent

end
