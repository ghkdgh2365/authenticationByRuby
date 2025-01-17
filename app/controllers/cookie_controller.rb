class CookieController < ApplicationController
  def new
  end

  def create
    if params[:email].present? && params[:password].present?
      user = User.find_by(email: params[:email])
      if user.present?
        if user.authenticate(params[:password])
          cookies[:email] = user.email
          cookies[:password] = user.password_digest
          flash[:notice] = "로그인 성공"
          redirect_to '/home/index'
          return
        else
          flash[:notice] = "잘못된 비밀번호 입니다. 다시 확인해주세요."
        end
      else
        flash[:notice] = "잘못된 이메일입니다. 다시 확인해주세요."
      end
    else
      flash[:notice] = "이메일, 패스워드 모두 입력해주세요."
    end
    redirect_to cookie_new_path
  end

  def destroy
    if current_user.present?
      cookies.delete :email
      cookies.delete :password
      redirect_to cookie_new_path
    end
  end
end