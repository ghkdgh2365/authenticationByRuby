class CookieController < ApplicationController
  def new
  end

  def create
    if params[:email].present? && params[:password].present?
      puts "bb"
      user = User.find_by(email: params[:email])
      if user.present?
        if user.authenticate(params[:password])
          cookies[:email] = user.email
          cookies[:password] = user.password_digest
          puts "로그인 성공"
          redirect_to '/home/index'
        else
          puts "잘못된 비밀번호 입니다. 다시 확인해주세요."
        end
      else
        puts"잘못된 이메일입니다. 다시 확인해주세요."
      end
    else
      puts "이메일, 패스워드 모두 입력해주세요."
    end
  end
end