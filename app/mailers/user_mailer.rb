class UserMailer < ApplicationMailer
    default from: 'welcome@myworld.com'
   
    def welcome_email
      @user = params[:user]
      mail(to: @user.email, subject: '회원가입을 축하합니다.')
    end
end