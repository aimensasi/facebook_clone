class Status < ActiveRecord::Base

	validates :title, :presence => true, :length => {:minimum => 8, :message => "title is too short"}
	validates :content, :presence => true, :length => {:minimum => 10, :message => "content is too short"}

	has_many :likes,  :dependent => :destroy
	belongs_to :user

	def self.first
		order(:created_at => :DESC).first
	end
end
