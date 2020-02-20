class Todolist < ApplicationRecord
  has_many :todolistitems, foreign_key: :todolist_id, class_name: 'Todolistitem', dependent: :destroy
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  validates :title, presence: true, length: { in: 5..25 }
end
