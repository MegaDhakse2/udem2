class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories #, class_name: "varietie" , foreign_key: "reference_id"
  has_many :varieties, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :author, presence: true, length: { minimum: 3, maximum: 10 }
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
end
