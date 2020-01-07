class SessionsController < ApplicationController
  def new
  end
  
  def create
    user=User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user #log_inメソッドを実行 userを引数として渡す
      redirect_to root_path, success: 'ログインに成功しました'
       # binding.pry
    else
      flash.now[:danger]='ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id]=user.id
    
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
