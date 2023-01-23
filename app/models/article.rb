class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 10 }
  validates :author, presence: true, length: { minimum: 3, maximum: 10 }
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
end
