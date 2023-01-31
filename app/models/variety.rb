class Variety < ApplicationRecord
  has_many :article_categories #, class_name: "article_categorie" , foreign_key: "reference_id"
  has_many :articles, through: :article_categories

  validates :name,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 3,
              maximum: 10
            } #, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
end
