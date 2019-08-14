module AnswersHelper
	def answer?(ques_id)
		Answer.find_by(user_id: current_user.id,question_id: ques_id) == nil
	end
end
