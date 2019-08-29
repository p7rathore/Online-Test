class Admin::PapersController < ApplicationController
	before_action :set_paper, only: [:show, :edit, :update, :destroy ]

  def index
   @papers = Paper.all
   # @results = Result.all
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
      begin
        @paper = Paper.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render file: "#{Rails.root}/app/views/users/undef.html", layout: true
      end
    end

    def paper_params
      params.require(:paper).permit(:name, questions_attributes: [:id, :question, :q_type, :marks, :minutes,:hours,:seconds,  :_destroy, options_attributes:[:id, :option, :is_correct, :_destroy]])
    end
end