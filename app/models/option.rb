class Option < ApplicationRecord
  belongs_to :question

  has_many :answeroptions
  has_many :answers, through: :answeroptions

end
