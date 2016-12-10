class Sub < ActiveRecord::Base
  validates :user_id, :description, :title, presence: true
  validates :title, uniqueness: true

  has_many :posts, through: :post_subs
  has_many :post_subs, inverse_of: :sub

  belongs_to :moderator,
  class_name: "User"

end
