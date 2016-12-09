class Post < ActiveRecord::Base
  validates :title, :user_id, :sub_id, presence: true

  belongs_to :sub

  belongs_to :author,
  class_name: "User"

end
