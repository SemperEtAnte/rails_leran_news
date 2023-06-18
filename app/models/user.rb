class User < ApplicationRecord

  has_secure_password validations: false
  validates :email, presence: true, uniqueness: {case_sensitive: false},format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {minimum: 3, maximum: 32}, if: ->(m) { m.password.present? }

  def token
    JWT.encode({user_id: self.id, exp: (Time.now+1.days).to_i}, 'test_token')
  end


  def as_json(options = {})
    attr = super
    attr.except('password_digest')
  end
end
