# frozen_string_literal: true

require 'google/apis/civicinfo_v2'
require 'csv'
require 'erb'

puts 'Event Manager Initialized!'

def show
  contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
  template_letter = File.read('form_letter.erb')
  erb_template = ERB.new template_letter

  contents.each do |row|
    id = row[0]
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    phone_number = clean_phone_number(row[:homephone])
    legislators = legislators_by_zipcode(zipcode)
    form_letter = erb_template.result(binding)
    save_thank_you_letter(id, form_letter)
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def legislators_by_zipcode(_zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone_number)
  phone_number.gsub!(/[^\d]/,'')
  if phone_number.length == 10
    # good number
    phone_number
  elsif phone_number.length == 11 && phone_number[1] == 1
    # trim first digit
    phone_number[1..-1]
  else
    # bad number
    "Wrong number!!"
  end
end

def show_names
  lines = File.readlines('event_attendees.csv')
  lines.each_with_index do |line, i|
    next if i.zero?

    columns = line.split(',')
    name = columns[2]
    p name
  end
end

show
