class Vacancy < ApplicationRecord
  belongs_to :job

  def to_s
    "#{date.strftime('%Y/%m/%d')} (#{price.to_s(:delimited)}円)"
  end
end
