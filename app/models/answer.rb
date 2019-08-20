class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :paper, through: :question

  has_many :answeroptions,dependent: :destroy
  has_many :options, through: :answeroptions
  

  def score
		correct_options=question.correct.map(&:id)
  	user_options=options.map(&:id)
  	if correct_options.size==user_options.size
  		if (user_options-correct_options).empty?
  			return question.marks
  		else
  			return 0
  		end
		end
		return 0
	end
end