class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show,:result]

  def index
    @users = User.all
  end

  def result
    @result=@user.results
  end
  
  def show
  end
  
  private
    def set_user
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render file: "#{Rails.root}/app/views/users/undef.html", layout: true
      end 
    end
end