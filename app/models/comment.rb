class Comment < ActiveRecord::Base
  paginates_per 3

	belongs_to :post
	belongs_to :user
end
