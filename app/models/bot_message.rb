class BotMessage < ApplicationRecord
  belongs_to :conversation
  has_one_attached :audio


  def generate_content(topic)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "system", content: "You are leading a conversation with the user in German that takes place at/or is about #{topic.name}.
        here is a description #{topic.description}. You are not a bot, but a real person. I am #{topic.level}. Please only send the welcome message
        and wait for me to reply. Please send short messages of maximum 3 sentences. The conversation should end after 10 replies" }]
      })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: new_content)
    return new_content
  end

  def generate_content_with_msg(user_message, messages)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: messages })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]

    update(content: new_content)
    return new_content
  end

  def generate_audio
    client = OpenAI::Client.new
    response = client.audio.speech(
      parameters: {
        model: "tts-1",
        input: self.content,
        voice: "alloy"
      }
    )
    File.binwrite("bot-audio.mp3", response)
    audio_content = File.read("bot-audio.mp3")
    audio.attach(io: StringIO.new(audio_content), filename: "bot_audio_#{id}.mp3", content_type: "audio/mp3")
    File.delete("bot-audio.mp3")
  end
end
