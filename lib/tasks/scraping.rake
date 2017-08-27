require 'net/http'

namespace :scraping do
  task run: :environment do
    vacancies = 7.times.map do |n|
      date = Date.today + n.month
      html = get(date)
      parse(html).map do |day, empty, price|
        Vacancy.new(date: date.change(day: day), price: price)
      end
    end.flatten(1)

    Job.create(vacancies: vacancies)
  end

  def get(date)
    param = date.strftime('%Y%m')
    url = "http://rurubu.travel/hrsv/PlanDetail.aspx?st=4296007&sk=20&pc=1030090TREGU0&rc=2007040090TREGU0&rv=4O20&tbpn=2&cf=#{param}"
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
