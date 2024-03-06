class UserMessage < ApplicationRecord
  after_save :generate_bot

  belongs_to :conversation
  belongs_to :bot_message

  def generate_bot
    messages = BotMessage.where(conversation_id: conversation.id).map { |msg| { role: "system", content: msg.content}}
    UserMessage.where(conversation_id: conversation.id).each { |msg| messages << { role: "user", content: msg.content}}
    bot = BotMessage.new(conversation: conversation)
    bot.save
    bot.generate_content_with_msg(content, messages)
  end
end
