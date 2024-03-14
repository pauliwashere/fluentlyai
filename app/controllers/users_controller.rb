class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:choose_language_level]

  def set_language_level
    current_user.update(level: params[:level])
    redirect_to topics_path
  end
end
