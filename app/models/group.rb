class Group < ActiveRecord::Base
	has_many :users
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
