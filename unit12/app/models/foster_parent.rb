class FosterParent < ActiveRecord::Base
	has_many :line_pets, :dependent => :destroy
  belongs_to :pet
end
