class Group < ApplicationRecord
  validates :title, presence: { message: "不能为空" }
end
