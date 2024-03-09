class UserMessagesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @bot_message = BotMessage.order(created_at: :desc).find_by(conversation: @conversation)
    @user_message = UserMessage.new(user_message_params)
    @user_message.conversation = @conversation
    @user_message.bot_message = @bot_message
    if @user_message.save
      # @bot_message.generate_content_with_msg(@user_message)
      FeedbackJob.perform_later(@user_message)
      redirect_to conversation_path(@conversation)
    else
      render "conversations/show", status: :unprocessable_entity
    end
  end

  def process_audio
    audio_file = params[:audio] # Access the uploaded file object
    file = File.open(Rails.root.join('public', "#{audio_file.original_filename}.mp3"), 'wb') do |file|
      file.write(audio_file.read)
    end
    client = OpenAI::Client.new
    response = client.audio.transcribe(
      parameters: {
        model: "whisper-1",
        file: File.open("#{Rails.root}/public/blob.mp3", "rb"),
      })
    respond_to  do |format|
        format.html
        format.text {render( plain: response["text"])}
    end
  end

  private

  def user_message_params
    params.require(:user_message).permit(:content, :bot_message_id)
  end
end
