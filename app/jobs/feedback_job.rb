class FeedbackJob < ApplicationJob
  queue_as :default

  def perform(user_message)
    client = OpenAI::Client.new
    # messages = [{ role: "user", content: user_message.content }]
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      # messages: messages
      messages: [{ role: "system", content: "Give only a corrected sentence or improved vesion of #{user_message.content} regarding grammar and vocabulary choice}. Only if there are no corrections or improvements from your side, then display 'Gut gemacht'."}]
      })
    feedback_content = chaptgpt_response["choices"][0]["message"]["content"]
    user_message.update(feedback: feedback_content)
    return feedback_content
  end
end
