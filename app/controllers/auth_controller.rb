class AuthController < ApplicationController
  def sign_in
  end

  def verify
    if params[:email].present? && params[:password].present?
      user = User.find_by(email: params[:email])
      if user
        if user.authenticate(params[:password])
          session[:auth_token] = JWT.encode({user_id: user.id, exp: 1.month.from_now.to_i}, Rails.application.credentials.secret_key_base)
          flash[:notice] = "로그인 성공"
          redirect_to root_path
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
    redirect_to auth_sign_in_path
  end

  def sign_out
    if current_user.present?
      reset_session
      flash[:notice] = "jwt 로그아웃 성공"
      redirect_to root_path
    end
  end
end