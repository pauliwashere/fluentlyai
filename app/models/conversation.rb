class Conversation < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :bot_messages
  has_many :user_messages
end
