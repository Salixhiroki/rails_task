class User < ApplicationRecord

validates :name, presence: true
validates :email, presence: true

# password => 長さを8以上32以下
validates :password, length: { in: 8..32 }
# validates :password_confirmation, length: { in: 8..32 }

# パスワード=>アルファベット、数字それぞれ1文字以上含む
VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
validates :password, format: { with: VALID_PASSWORD_REGEX  }

has_secure_password

#email => ~~@~~.~
VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { with: VALID_EMAIL_REGEX }

# name => 15文字以下
validates :name, length: { maximum: 15 }

#user:topics 1 対 多
has_many :topics
has_many :favorites
has_many :favorite_topics, through: :favorites, source: 'topic'
end
