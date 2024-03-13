class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.order(created_at: :desc)
    @topics = @conversations.group_by { |c| c.topic.name }.transform_values(&:count)
    @conversations_per_week = @conversations.where("created_at >= ?", 10.weeks.ago)
      .group_by { |c| c.created_at.beginning_of_week }
      .transform_values(&:count)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @bot_message = @conversation.bot_messages.last
    # @conversation.user = @user
    # @user = current_user
    @user_message = UserMessage.new
    @highest_bot_id = @conversation.bot_messages.max { |bot_message| bot_message.id }.id
  end

  def create
    @user = current_user
    @topic_id = params[:conversation][:topic_id]
    @conversation = Conversation.new(topic_id: @topic_id, user: @user)
    if @conversation.save
      @bot_message = BotMessage.new
      @bot_message.conversation = @conversation
      @bot_message.generate_content(@conversation.topic)
      @bot_message.generate_audio # place might change
      @bot_message.save
      redirect_to conversation_path(@conversation)
    else
      render 'topics/index', status: :unprocessable_entity
    end
  end

  def end
    @my_current_conversation = Conversation.find(params[:id])
    @my_current_conversation = false
    redirect_to topics_path
  end
end
