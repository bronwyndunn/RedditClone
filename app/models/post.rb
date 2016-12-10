class Post < ActiveRecord::Base
  validates :title, :user_id, presence: true

  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs

  belongs_to :author,
  class_name: "User"

end
