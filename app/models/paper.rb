class Paper < ApplicationRecord

	has_many :questions 
	has_many :results
	accepts_nested_attributes_for :questions,allow_destroy: true
end
