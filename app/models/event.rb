class Event < ActiveRecord::Base
	has_many :comments, as: :Commentable, dependent: :destroy
	accepts_nested_attributes_for :comments
	TYPES = ['Birthday', 'Marriage', 'Upanayanam', 'MarriageAnniversary']
end
