class User < ActiveRecord::Base

  has_secure_password

  #posts created by the user
  has_many :posts

  #votes ABOUT this user (via votable)
  has_many :votes, as: :votable

  #votes cast by the user(via user_id foreign key)
  has_many :ratings, class_name: 'Vote'

  has_many :comments

  validates :username,
    presence: true,
    length: {mimimum: 3, maximum: 20}

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
