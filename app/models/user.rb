class User < ActiveRecord::Base

  has_secure_password

  has_many :posts

  validates :username,
    presence: true,
    length: {maximum: 20}

  validates :email,
    presence: true,
    email_format: { message: "Doesn't look like an email address" },
    uniqueness: {case_sensitive: false}

  validates :password,
    presence: true,
    :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate,password)
  end


end
