class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @conversation = Conversation.new
  end
end
