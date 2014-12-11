class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    if user.uid == Settings.bonbon_uid
      redirect_to votes_select_path
    else
      redirect_to votes_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
