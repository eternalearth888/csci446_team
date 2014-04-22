class User < ActiveRecord::Base
	authenticates_with_sorcery!
	validates :password, length: { minimum: 5 }, :allow_blank => true
	validates :password, confirmation: true
	#validates :password_confirmation, presence: true
	validates :username, uniqueness: true
end
