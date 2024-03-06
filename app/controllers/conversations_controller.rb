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
end
