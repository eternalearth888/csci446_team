class Item < ActiveRecord::Base
	validates :title, length: {maximum: 100}, presence: true
end
