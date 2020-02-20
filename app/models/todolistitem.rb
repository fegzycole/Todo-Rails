class Todolistitem < ApplicationRecord
  belongs_to :todolist, foreign_key: :todolist_id, class_name: 'Todolist'
  validates :completed, inclusion: { in: [ true, false ] }
  validates :name, presence: true, on: :create
  validates :name, length: { maximum: 200 }
end
