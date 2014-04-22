require 'carrierwave/orm/activerecord'

class Item < ActiveRecord::Base
	mount_uploader :itemimage, ItemImageUploader

	validates :title, length: {maximum: 100}, presence: true
end
