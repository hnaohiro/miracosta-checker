class Job < ApplicationRecord
  has_many :vacancies, dependent: :destroy
  default_scope { order('id DESC') }
  after_create :notification, if: :exists_new_vacancies

  def exists_new_vacancies
    new_one = Job.first.vacancies.pluck(:plan_id, :date)
    old_one = Job.second.vacancies.pluck(:plan_id, :date)
    (new_one - old_one).present?
  end

  def notification
    NotificationMailer.push(self).deliver
  end
end
