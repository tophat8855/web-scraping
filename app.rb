require 'Nokogiri'
require_relative './lib/review'

def score_distribution(reviews)
  
end

file = File.open('data/fat-angel.html')
noko_html_doc = Nokogiri::HTML(file.read)

array_of_reviews = noko_html_doc.css("ul.reviews > li").map {|review| Review.new(review)}



first_review = array_of_reviews.first
p first_review.date
p first_review.star_count
p first_review.author
p first_review.text
p first_review.five_star?
