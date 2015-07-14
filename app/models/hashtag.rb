class Hashtag < ActiveRecord::Base
	has_and_belongs_to_many :statuses
	validates :name, presence: true, uniqueness: true

	def self.statuses_by_hashtag(tagname)
		self.find_by_name(tagname).statuses
	end
end
