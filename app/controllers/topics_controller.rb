class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @user = current_user
    @conversation = Conversation.new
  end
end
