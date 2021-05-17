class Post < ApplicationRecord
  validates_presence_of :name, :title
  validates_length_of :title, :minimum => 10
  has_many :comments, dependent: :destroy
end
