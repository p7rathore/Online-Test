class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy, :start_test, :test, :submit]
  before_action :require_admin, except: [:index, :show, :start_test, :test, :submit]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @questions = @paper.questions
  end

  def test
    @questions=@paper.questions.page(params[:page]).per_page(1)
    @answer = @questions.first.answers.new
    
  end


  def start_test

  end
  def submit
    @user = current_user.id
    answer_paper_params[:option_ids].each do |option_id|
      @answer=Answer.new
      @answer.user_id=@user
      @answer.question_id=answer_paper_params[:question_id]
      @answer.option_id=option_id
      @answer.paper_id=params[:id]
      
        @answer.save 
      ans=Answer.last
      

      if ans.option.is_correct
        ans.score = ans.question.marks 
        ans.save
      end    
    end

    # @page = params[:answer][:page].to_i + 1
    # @questions=@paper.questions.page(@page).per_page(1)
    # binding.pry
    # @answer = @questions.first.answers.new if @questions.present?
  end
  # GET /papers/new
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
    def answer_paper_params
      # params.require(:paper).permit(:name)
      params.require(:answer).permit(:user_id, :paper_id, :question_id, :option_ids=>[])
    end

    def require_admin
      unless current_user.admin
        redirect_to root_path, notice: 'You are not admin!'
      end
    end

end 
