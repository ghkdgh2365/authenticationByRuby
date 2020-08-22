class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:email].present? && params[:password].present?
      user = User.find_by(email: params[:email])
      if user
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          flash[:notice] = "세션 로그인 성공"
          redirect_to '/home/index'
          return
        else
          flash[:notice] = "잘못된 비밀번호 입니다. 다시 확인해주세요."
        end
      else
        flash[:notice] = "잘못된 이메일입니다. 다시 확인해주세요."
      end
    else
      flash[:notice] = "이메일, 비밀번호 모두 입력해주세요"
    end
    redirect_to sessions_sign_in_path
  end

  def destroy
    if current_user.present?
      reset_session
      flash[:notice] = "세션 로그아웃 성공"
      redirect_to '/home/index'
    end
  end
end