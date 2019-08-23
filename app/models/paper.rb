class Paper < ApplicationRecord
	# belongs_to :user
	has_many :questions,dependent: :destroy 
	has_many :results,dependent: :destroy
	accepts_nested_attributes_for :questions,allow_destroy: true

	def marks
		questions.map{|a| a.marks}.sum
	end
end
