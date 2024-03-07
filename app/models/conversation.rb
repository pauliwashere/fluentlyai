class Conversation < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :bot_messages, dependent: :destroy
  has_many :user_messages, dependent: :destroy
end
