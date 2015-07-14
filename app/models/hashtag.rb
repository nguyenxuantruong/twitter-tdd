class Hashtag < ActiveRecord::Base
	has_and_belongs_to_many :statuses
	validates :name, presence: true, uniqueness: true
end
