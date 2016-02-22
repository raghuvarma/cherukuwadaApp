class Post < ActiveRecord::Base
	has_many :comments, as: :commentable, dependent: :destroy
	accepts_nested_attributes_for :comments
end
