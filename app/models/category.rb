class Category < ApplicationRecord
  has_many :categories_projects
  has_many :projects, through: :categories_projects

end
