class FeedbackJob < ApplicationJob
  queue_as :default

  def perform(user_message, bot_message)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "system", content: "Give feedback on this message: #{user_message.content} which is a response to: #{bot_message.content}.
      Focus on grammar and vocabulary.
      Give improvement on the #{user_message.content}.
      Reply in English.
      Be accurate and honest."}, {role: "assistant", content: "#{bot_message.content}"}, {role: "user", content: "#{user_message.content}"}]
      })
    feedback_content = chaptgpt_response["choices"][0]["message"]["content"]
    user_message.update(feedback: feedback_content)
    return feedback_content
  end
end
