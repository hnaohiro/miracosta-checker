class AddColumnToVacancy < ActiveRecord::Migration[5.1]
  def change
    add_reference :vacancies, :plan, index: true
  end
end
