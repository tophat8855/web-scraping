require 'rubygems'
require 'active_record'
require_relative './lib/review'

ActiveRecord::Base.establish_connection(
:adapter  => 'sqlite3',
:database => 'scraper.db',
)

Review.create(
  text: "this place is awesome",
  date: Date.today,
  author: 'tophat8855',
  star_count: 3,
)
