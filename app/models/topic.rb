class Topic < ApplicationRecord
  has_many :conversations
  has_one_attached :picture
end
