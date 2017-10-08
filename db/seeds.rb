Dir.glob(Rails.root.join('db/seeds/*.yml')).each do |filename|
  model = File.basename(filename, '.yml').classify.constantize

  YAML.load_file(filename).each do |record|
    model.find_or_initialize_by(record).save
  end
end