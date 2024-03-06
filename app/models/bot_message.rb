class BotMessage < ApplicationRecord
  belongs_to :conversation


  def generate_content(topic)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "system", content: "Have a conversation with me that takes place at/or is about #{topic.name}.
        here is a description #{topic.description}. I am #{topic.level} in German. Please only send the welcome message
        and wait for me to reply." }]
      })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: new_content)
    return new_content
  end

  def generate_content_with_msg(user_message, messages)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      # messages: [{ role: "assistant", content: user_message.bot_message.content },
      #   { role: "user", content: user_message.content },
      #   { role: "user", content: "Ich möchte ein Apfel kaufen" } ]
      # })
      messages: messages })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]

    update(content: new_content)
    return new_content
  end
end
