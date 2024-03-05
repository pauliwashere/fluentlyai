class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:choose_language_level]
  def choose_language_level

  end

  def set_language_level
    current_user.update(language_level: params[:level])
    redirect_to some_path # replace with where you want to redirect the user
  end
end
