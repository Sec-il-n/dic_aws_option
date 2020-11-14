class ConfirmMailer < ApplicationMailer
  def confirm_mail(user)
    @user = user
    mail to: "#{@user.email}", subject: "写真が投稿されました。"
  end
end
