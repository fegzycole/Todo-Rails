class User < ApplicationRecord
  has_many :todos, foreign_key: :user_id, class_name: 'Todolist'
  validates :first_name, presence: true, length: { in: 2..15 }
  validates :last_name, presence: true, length: { in: 2..15 }

  def self.get_user_data(id)
    user = User.find(id)
    user = user.as_json(include: { todos: { include: :todolistitems } })
  end
end
