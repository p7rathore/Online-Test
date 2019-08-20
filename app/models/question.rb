class Question < ApplicationRecord
  belongs_to :paper
	has_many :options,dependent: :destroy
	has_many :answers,dependent: :destroy
  accepts_nested_attributes_for :options,allow_destroy: true
  
  def correct
  	options.where(is_correct: true)
  end

end

