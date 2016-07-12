class PageController < ApplicationController
  def index
    if session[:user_id].nil?

    else
      redirect_to raffles_path
    end
  # redirect_to register_path if session[:user_id].nil?
end

def secret
  redirect_to root_path unless current_user.admin?
end
end
