class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	belongs_to :group
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: {case_sensitive: false}

	  # Returns the hash digest of the given string.
  def Group.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
