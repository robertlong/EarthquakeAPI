require 'CSV'
require 'net/http'
require 'logger'

task :get_earthquakes => :environment do

  logger = Logger.new('get_earthquakes.log', 'daily')

  logger.info 'Starting task.'

  uri = URI('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt')
  logger.info 'Got earthquake data.'

  response = Net::HTTP.get(uri)
  last_earthquake = Earthquake.order(:time).first

  new_earthquakes = 0

  CSV.parse(response,{:headers => true}) do |row|

    if last_earthquake && last_earthquake.id == row['Eqid']
       break
    end

    e = Earthquake.new()

    e.id = row['Eqid']
    e.src = row['Src']
    e.version row['Version']
    e.datetime = DateTime.strptime(row['Datetime'], '%A, %b %e, %Y %H:%M:%S')
    e.lat = row['Lat']
    e.lon = row['Lon']
    e.magnitude = row['Magnitude']
    e.depth = row['Depth']
    e.nst = row['NST']
    e.region = row['Region']

    e.save!()

    new_earthquakes += 1

  end

  logger.info "Added #{new_earthquakes} new earthquakes."
  logger.info 'Finished task.'

end