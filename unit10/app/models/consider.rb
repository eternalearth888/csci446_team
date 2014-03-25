class Consider < ActiveRecord::Base
  has_many :line_pets, dependent: :destroy
	#func for making sure there are not duplicate pets
	def add_pet(pet_id)
		current_pet=line_pets.find_by_pet_id(pet_id) #try to find pet in 'cart'
		if current_pet #if you found pet, just return it
			current_pet
		else #otherwise add pet to cart
			current_pet = line_pets.build(:pet_id => pet_id)
		end
	end
end

