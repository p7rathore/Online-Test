class Question < ApplicationRecord
  belongs_to :paper
	has_many :options
  accepts_nested_attributes_for :options,allow_destroy: true
  
  def correct
  	options.where(is_correct: true)
  end

end

