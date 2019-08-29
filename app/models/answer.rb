class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :paper, through: :question

  has_many :answeroptions,dependent: :destroy
  has_many :options, through: :answeroptions
  
  def is_correct?
    correct_options=question.correct.map(&:id)
    user_options=options.map(&:id)
    correct_options.size==user_options.size and (user_options-correct_options).empty?
  end
  
  def score
		if is_correct?
  		return question.marks
  	end
  0
	end


end