class User < ApplicationRecord
    has_secure_password
    has_many :shops
    
    validates :email, format: { with: /@/, message: "must have an @" }, uniqueness: true
    validates :name, presence: true
    
    before_create { generate_token(:auth_token) }
    
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest != '0'
    end
    
    
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
    def send_password_reset
       generate_token(:password_reset_token)
       self.password_reset_sent_at = Time.zone.now
       save!
       UserMailer.password_reset(self).deliver
    end
end
