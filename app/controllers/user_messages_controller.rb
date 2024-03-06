class UserMessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @bot_message = BotMessage.where(conversation_id: @conversation.id).last
    @user_message = UserMessage.new(user_message_params)
    # @user_message.user = current_user
    @user_message.conversation = @conversation
    @user_message.bot_message = @bot_message
    # @user_messages = UserMessage.where(conversation_id: @conversation)
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
