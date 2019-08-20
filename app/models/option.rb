class Option < ApplicationRecord
  belongs_to :question

  has_many :answeroptions,dependent: :destroy
  has_many :answers, through: :answeroptions

end
