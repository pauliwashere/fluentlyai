class ConversationsController < ApplicationController
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
