class Like < ActiveRecord::Base

	validates_presence_of :user_id, :status_id
	validates_uniqueness_of :user_id, :scope => :status_id

	belongs_to :user
	belongs_to :status
end
