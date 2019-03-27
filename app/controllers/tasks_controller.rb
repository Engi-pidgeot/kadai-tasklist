class TasksController < ApplicationController
before_action :require_user_logged_in, only: [:new, :edit, :show]
before_action :set_task, only: [:show, :edit, :update, :destroy]


include SessionsHelper

  def index
    if logged_in?
      @tasks = current_user.tasks.page(params[:page]).per(20)
    end
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "タスクが追加されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの登録に失敗しました。"
      render :new
    end
  end
  
  def new
    @task = current_user.tasks.build
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスク内容が変更されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの変更に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "メッセージは無事削除されました。"
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
    if current_user.id != @task.user_id
     flash[:danger] = "指定されたタスクの作成者ではありません"
     redirect_to root_path
    end
  end
end
