class LinePet < ActiveRecord::Base
	belongs_to :foster_parent
  belongs_to :pet
  belongs_to :consider
end
