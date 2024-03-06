class UserMessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @bot_message = BotMessage.order(created_at: :desc).find_by(conversation: @conversation)
    @user_message = UserMessage.new(user_message_params)
    @user_message.conversation = @conversation
    @user_message.bot_message = @bot_message
    if @user_message.save
      # @bot_message.generate_content_with_msg(@user_message)
      redirect_to conversation_path(@conversation)
    else
      render "conversations/show", status: :unprocessable_entity
    end
  end

  private

  def user_message_params
    params.require(:user_message).permit(:content, :bot_message_id)
  end
end
