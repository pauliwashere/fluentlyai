class UserMessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @bot_message = BotMessage.where(conversation_id: @conversation).last
    @user_message = UserMessage.new(user_message_params)
    # @user_message.user = current_user
    @user_message.conversation = @conversation
    @user_message.bot_message = @bot_message

    if @user_message.save
      redirect_to conversation_path(@conversation)
      #@bot_message = BotMessage.new
      #@bot_message.generate_content(@conversation.topic) # continue here
    else
      render "conversations/show", status: :unprocessable_entity
    end
  end

  private

  def user_message_params
    params.require(:user_message).permit(:content, :bot_message_id)
  end
end
