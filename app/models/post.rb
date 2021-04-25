class Post < ApplicationRecord
  belongs_to :account
  validates :content, length: { maximum: 140 }, presence: true
end
