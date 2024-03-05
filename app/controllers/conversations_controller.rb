class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @bot = BotMessage.new
    # @conversation.user = @user
    # @user = current_user
    @user_message = UserMessage.new
    @bot.conversation = @conversation
    @bot.save

    @bot.generate_content(@conversation.topic)
  end
end
