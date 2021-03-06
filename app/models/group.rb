class Group < ApplicationRecord

  validates :title, presence: { message: "不能为空" }
  belongs_to :user
  has_many :posts
  has_many :group_relationships
  has_many :members, :through => :group_relationships, :source => :user

  scope:recent, ->{order("created_at DESC")}
end
