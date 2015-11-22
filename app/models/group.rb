class Group < ActiveRecord::Base
	has_many :users
	validates :name, presence: true, length: {maximum: 100},
		uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
