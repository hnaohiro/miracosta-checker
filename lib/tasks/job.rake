namespace :job do
  task delete_old: :environment do
    Job.where('created_at <= ?', 2.days.ago).destroy_all
  end
end
