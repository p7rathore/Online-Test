class Question < ApplicationRecord
  belongs_to :paper
	has_many :options
  has_many :answers 
  accepts_nested_attributes_for :options
end
