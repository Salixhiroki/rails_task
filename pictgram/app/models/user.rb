class User < ApplicationRecord

validates :name, presence: true
validates :email, presence: true
validates :password, length: { in: 8..32 }
# validates :password_confirmation, length: { in: 8..32 }

VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
validates :password, format: { with: VALID_PASSWORD_REGEX  }

has_secure_password


VALID_EMAIL_REGEX =/[^\s]@[^\s]/
validates :email, format: {with: VALID_EMAIL_REGEX}


validates :name, length: { maximum: 15 }

end
