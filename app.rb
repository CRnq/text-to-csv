require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

post '/convert' do
  text = params[:text].to_s

  csv_data = CSV.generate do |csv|
    text.each_line do |line|
      next if line.strip.empty?

      csv << line.chomp.parse_csv
    end
  end

  content_type 'text/csv'
  attachment 'converted.csv'
  csv_data
end
