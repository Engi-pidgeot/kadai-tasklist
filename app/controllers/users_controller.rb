class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
    #使用しない
  end

  def show
    @count_tasks = current_user.tasks.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規ユーザとして登録しました"
      redirect_to @user
    else
      flash[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
