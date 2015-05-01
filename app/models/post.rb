class Post < ActiveRecord::Base

  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments


  validates :title,
    presence: true,
    length: {minimum: 8,maximum: 100}

  validates :link,
    presence: true,
    format: {with: URI.regexp}




end
