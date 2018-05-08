class Group < ApplicationRecord
  validates :title, presence: { message: "不能为空" }
  belongs_to :user
end
