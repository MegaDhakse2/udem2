class ArticleCategory < ApplicationRecord
  belongs_to :article #, class_name: "article ", foreign_key: "article _id"
  belongs_to :variety #, class_name: "object", foreign_key: "object_id"
end
