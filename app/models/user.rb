class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, :presence => true, :uniqueness => true, :format => {:with => EMAIL_REGEX}
	validates :name, :presence => true
	validates :password, :presence => true, :length => {:in => 6..20}
	validates :password_confirmation, :presence => true

	has_many :statuses, :dependent => :destroy
	has_many :likes, :dependent => :destroy 
end
