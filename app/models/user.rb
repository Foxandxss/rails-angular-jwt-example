class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_many :messages

  has_secure_password

  def as_json(options={})
    options[:except] ||= [:password_digest, :created_at, :updated_at]
    super(options)
  end
end
