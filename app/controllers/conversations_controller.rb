class ConversationsController < ApplicationController
  def show
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Lead me through a simple conversation that takes place at/or is about #{@topic.name}.
        here is a description #{@topic.description}. The conversation is for someone who is #{topic.level} in German."}]
    })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
  end
end
