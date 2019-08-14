class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy, :start_test, :test, :submit, :submit_test]
  before_action :require_admin, except: [:index, :show, :start_test, :test, :submit, :result, :submit_test]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
    @result = Result.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @questions = @paper.questions
  end

  def test
    @questions=@paper.questions.page(params[:page]).per_page(1)
    @answer = Answer.new
    @answer.question=@questions.first
  end
  
  def result
    @result=Result.where(user_id: current_user.id)
  end

  def submit_test
    @result=Result.new(user_id: current_user.id, paper_id: params[:id])
    @ans=Answer.where(user_id: current_user.id)
    @new_arr = @ans.select{|a| a.question.paper.id == params[:id].to_i}
    @new_arr.each do |b|
      @result.score += b.score
    end   
    if @result.save
        redirect_to "#",notice: "your Test successfully done"
    end

  end
  
  def start_test
  end
  
  def submit
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.save
    @questions=@paper.questions.page(params[:page].to_i).per_page(1)
    @answer = Answer.new
    @answer.question=@questions.first
    render 'submit.js.erb'
  end
  # GET /papers/1new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      # params.require(:paper).permit(:name)
      params.require(:paper).permit(:name, questions_attributes: [:id, :question, :q_type, :marks, :duration,  :_destroy, options_attributes:[:id, :option, :is_correct, :_destroy]])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :option_ids=>[] )
      
    end

    # def result_params
    #   params.permit(:id)
    # end
    
    def require_admin
      unless current_user.admin
        redirect_to root_path, notice: 'You are not admin!'
      end
    end

end 
