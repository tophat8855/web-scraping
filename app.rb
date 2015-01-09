require 'Nokogiri'
require_relative './lib/review'

def score_distribution(reviews)

end

file = File.open('data/fat-angel.html')
noko_html_doc = Nokogiri::HTML(file.read)

array_of_reviews = []

stars = {
  "1.0" => 0,
  "2.0" => 0,
  "3.0" => 0,
  "4.0" => 0,
  "5.0" => 0,
}

noko_html_doc.css("ul.reviews > li").each do |review|
  new_review = Review.new(review)
  array_of_reviews << new_review
  stars[new_review.star_count] += 1
end

p stars

first_review = array_of_reviews.first
p first_review.date
p first_review.star_count
p first_review.author
p first_review.text
p first_review.five_star?
