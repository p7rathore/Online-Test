class Paper < ApplicationRecord

	has_many :questions,dependent: :destroy 
	has_many :results,dependent: :destroy

	accepts_nested_attributes_for :questions,allow_destroy: true
end
