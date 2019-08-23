class PapersController < ApplicationController
  before_action :set_paper, only: [:start_test, :test, :submit, :submit_test,:result]
  # before_action :require_admin, except: [:start_test, :test, :submit, :result, :submit_test]
  def index
   @papers = Paper.all
   @results = Result.all
  end
 
  def start_test 
  
  end

  def test
    @questions=(@paper.questions-current_user.answers.map{|answer| answer.question}).shuffle
    
    if @questions.empty?
      redirect_to submit_test_path(@paper)
      return 
    end
    @answer = Answer.new(question_id:@questions.first.id)
  end
  
  def submit
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.save
    redirect_to test_path(@paper)
  end

  def submit_test
    
    @result=Result.find_by(user_id: current_user.id, paper_id: params[:id])
    if @result
      redirect_to result_path(@paper),notice: "your Test successfully done"
      return
    end
    @result=Result.new(user_id: current_user.id, paper_id: params[:id])
    @ans=Answer.where(user_id: current_user.id)
    @new_arr = @ans.select{|a| a.question.paper.id == params[:id].to_i}
    @new_arr.each do |b|
      @result.score += b.score
    end   
    if @result.save
        redirect_to result_path(@paper),notice: "your Test successfully done"
    end

  end

  def result
    @result=Result.where(user_id: current_user.id)
  end

 
  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :option_ids=>[] )
      
    end

    def result_params
      params.permit(:id)
    end
    
    # def require_admin

    #   unless current_user.admin
    #     redirect_to root_path, notice: 'You are not admin!'
    #   end
    # end

end 
