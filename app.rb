require 'Nokogiri'
require_relative './lib/review'

file = File.open('data/fat-angel.html')
html_doc = Nokogiri::HTML(file.read)

first_review = Review.new(html_doc)
p first_review.date
p first_review.star_count
p first_review.author
p first_review.text
p first_review.five_star?
