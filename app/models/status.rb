class Status < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :hashtags
  validates :content, presence: true

end
