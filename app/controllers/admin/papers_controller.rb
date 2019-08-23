class Admin::PapersController < ApplicationController
	before_action :set_paper, only: [:show, :edit, :update, :destroy ]
	before_action :require_admin, except: [:index]

  def index
   @papers = Paper.all
   @results = Result.all
  end

  def user
    user_id = Result.all.map(&:user_id).uniq
    @users = user_id.map{|user| User.find(user)}
  end

  def user_result
    user=User.find(params[:id])
    @result=user.results
 end
  
  def new
  	
  	@paper = Paper.new
  end
  
  def show
  	
    @questions = @paper.questions
  end
  
  def edit
  	
  end

  def create
  	
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to root_path, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	
  	respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to root_path, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  	
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def paper_params
      params.require(:paper).permit(:name, questions_attributes: [:id, :question, :q_type, :marks, :duration,  :_destroy, options_attributes:[:id, :option, :is_correct, :_destroy]])
    end

    def require_admin
      unless current_user.admin
        redirect_to root_path, notice: 'You are not admin!'
      end
    end
end