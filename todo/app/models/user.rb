class User < ApplicationRecord
  has_many :todo_apps
  validates :name, presence: true
end
