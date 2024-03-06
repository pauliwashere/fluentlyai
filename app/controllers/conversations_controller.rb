class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @bot_message = BotMessage.new
    # @conversation.user = @user
    # @user = current_user
    @user_message = UserMessage.new
    @bot_message.conversation = @conversation
    @bot_message.save

    @bot_message.generate_content(@conversation.topic)
  end

  def create
    @user = current_user
    @topic_id = params[:conversation][:topic_id]
    @conversation = Conversation.new(topic_id: @topic_id, user: @user)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render 'topics/index', status: :unprocessable_entity
    end
  end
end
