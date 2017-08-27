class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.references :job, foreign_key: true
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
