require 'Nokogiri'
require_relative './lib/nokoloader'

noko_object = NokoLoader.new("./data/fat-angel.html")
noko_object.loader
