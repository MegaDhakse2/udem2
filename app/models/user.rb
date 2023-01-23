class User < ApplicationRecord
  has_secure_password
  has_many :articles
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_FORMAT =
    /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x
  validates :username,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 3,
              maximum: 15
            } #, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
  validates :email,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 7,
              maximum: 30
            },
            format: {
              with: VALID_EMAIL_REGEX
            } #, if: :method_name?
  validates :password_digest,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            # length: {
            #   minimum: 8,
            #   maximum: 15
            # },
            format: {
              with: PASSWORD_FORMAT
            }
  #,if: :method_name?
end
