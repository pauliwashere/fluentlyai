class UserMessage < ApplicationRecord
  after_save :generate_bot

  belongs_to :conversation
  belongs_to :bot_message

  def generate_bot
    messages = [{ role: "system", content: "You are leading a conversation with the user in German that takes place at/or is about #{conversation.topic.name}.
      here is a description #{conversation.topic.description}. You are not a bot, but a real person. I am #{conversation.topic.level}. Please only send the welcome message
      and wait for me to reply. Please send short messages of maximum 3 sentences. The conversation should end after 10 replies" }]

    # Fetch all bot messages and user messages associated with the conversation
    bot_messages = BotMessage.where(conversation_id: conversation.id).order(created_at: :asc)
    user_messages = UserMessage.where(conversation_id: conversation.id).order(created_at: :asc)

    # Iterate through bot messages and user messages to construct the messages array
    bot_messages.each do |bot_message|
      messages << { role: "assistant", content: bot_message.content }
      associated_user_message = user_messages.find { |user_msg| user_msg.bot_message_id == bot_message.id }
      messages << { role: "user", content: associated_user_message.content } if associated_user_message
    end

    # Create a new bot message and pass the messages array to generate content
    bot = BotMessage.new(conversation: conversation)
    bot.save
    bot.generate_content_with_msg(content, messages)
    bot.generate_audio
  end
end
