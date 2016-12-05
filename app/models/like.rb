class Like < ActiveRecord::Base

	validates_presence_of :user_id, :status_id

	belongs_to :user
	belongs_to :status
end
