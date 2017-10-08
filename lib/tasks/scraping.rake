require 'net/http'

namespace :scraping do
  task run: :environment do
    vacancies = 7.times.map do |n|
      date = Date.today + n.month
      
      Plan.all.map do |plan|
        html = get(plan, date)
        parse(html).map do |day, empty, price|
          Vacancy.new(plan: plan, date: date.change(day: day), price: price)
        end
      end
    end.flatten

    Job.create(vacancies: vacancies)
  end

  def get(plan, date)
    url = "#{plan.url}&cf=#{date.strftime('%Y%m')}"
    Net::HTTP.get(URI.parse(url))
  end

  def parse(html)
    doc = Nokogiri::HTML.parse(html, nil, 'Shift_JIS')
    doc.css('table td').map do |node|
      day = node.css('.date').text.to_i
      empty = node.css('.room02').text
      price = node.css('.price_sum').text.gsub(/\D/, '').to_i
      [day, empty, price] if empty.present? && empty != '×'
    end.compact
  end
end
