class Group < ActiveRecord::Base
	has_many :users, dependent: :destroy
	validates :name, presence: true, length: {maximum: 100},
		uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
