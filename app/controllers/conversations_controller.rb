class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @bot = BotMessage.new
    @bot.conversation = @conversation
    @bot.save
    @bot.generate_content(@conversation.topic)
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.save
    redirect_to conversation_path(@conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:topic_id, :user_id)
  end
end
