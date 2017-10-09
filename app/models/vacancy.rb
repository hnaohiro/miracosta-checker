class Vacancy < ApplicationRecord
  belongs_to :job
  belongs_to :plan

  default_scope { order('id ASC') }

  def to_s
    "#{date.strftime('%Y/%m/%d')} (#{price.to_s(:delimited)}円)"
  end
end
