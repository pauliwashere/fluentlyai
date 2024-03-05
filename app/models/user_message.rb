class UserMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :bot_message
end
