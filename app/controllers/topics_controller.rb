class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = Topic.all
    @conversation = Conversation.new
  end
end
