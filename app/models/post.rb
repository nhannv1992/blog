class Post < ActiveRecord::Base
  extend FriendlyId

  validates_presence_of :title, :body, :excerpt

  friendly_id :title, use: :slugged

  paginates_per 3

	belongs_to :user
	has_many :comments


end


