class Sub < ActiveRecord::Base
  validates :user_id, :description, :title, presence: true
  validates :title, uniqueness: true

  has_many :posts

  belongs_to :moderator,
  class_name: "User"

end
