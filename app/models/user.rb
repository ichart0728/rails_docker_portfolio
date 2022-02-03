class User < ApplicationRecord
    # 'self' is referencing each ofject of the U ser class
    before_save { self.email = email.downcase}
    has_many :articles
    validates :username, presence: true, 
                            uniqueness: { case_sensitive: false }, 
                            length: { minimum: 3, maximum: 25 }

    # You can specify constant by naming them using all Caps
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                            uniqueness: { case_sensitive: false }, 
                            length: { maximum: 105 }, 
                            format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end