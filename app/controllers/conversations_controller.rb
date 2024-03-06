class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @bot = BotMessage.new
    @bot.conversation = @conversation
    @bot.save
    @bot.generate_content(@conversation.topic)
    @bot.generate_audio
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
