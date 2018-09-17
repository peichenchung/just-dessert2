class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    callback_from :instagram
  end

  private

  def callback_from(provider)
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = "#{provider}登入成功"
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:notice] = "登入失敗"
      redirect_to new_user_registration_url
    end
  end
end