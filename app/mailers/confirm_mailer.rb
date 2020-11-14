class ConfirmMailer < ApplicationMailer
  # confirmで何を受け取るのか
  def confirm_mail(user)
    @user = user
    mail to: "#{@user.email}", subject: "写真が投稿されました。"
  end
end
