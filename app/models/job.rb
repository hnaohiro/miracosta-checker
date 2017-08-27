class Job < ApplicationRecord
  has_many :vacancies, dependent: :destroy
  default_scope { order('id DESC') }
  # after_create :notification

  def notification
    NotificationMailer.push(self).deliver
  end
end
