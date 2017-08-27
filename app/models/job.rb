class Job < ApplicationRecord
  has_many :vacancies, dependent: :destroy
  default_scope { order('id DESC') }
end
