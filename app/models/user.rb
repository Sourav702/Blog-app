class User < ActiveRecord::Base
  has_secure_password
  has_many :posts,dependent: :destroy
  # has_many :posts,dependent: :nullfy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
