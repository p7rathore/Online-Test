class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :paper
  belongs_to :question
  belongs_to :option

  validates :option_id, presence: true 
  validates :question_id, presence: true
  validates :user_id, presence: true 
  validates :paper_id, presence: true
	

end
