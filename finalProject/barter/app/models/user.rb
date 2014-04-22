class User < ActiveRecord::Base
	has_many :items, dependent: :destroy
	authenticates_with_sorcery!

	validates :password, length: {minimum: 6}
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :username, uniqueness: true
end
