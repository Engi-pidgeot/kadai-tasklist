module SessionsHelper
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end
  # if @current_user
  #    return
  # else
  #    @current_user = User.find_by(id: session[:user_id])
  #    return @current_user
  # end
  
  def logged_in?
    !!current_user
  end
  # if current_user
  #   return true
  # else
  #   retur false
  # end
end
