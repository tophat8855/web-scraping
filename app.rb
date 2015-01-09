require 'Nokogiri'
require 'RestClient'
require_relative './lib/review'

def score_distribution(reviews)

end

file = RestClient.get('http://www.yelp.com/biz/fat-angel-san-francisco', user_agent: "Chrome")

# file = File.open('data/fat-angel.html')
html_doc = Nokogiri::HTML(file)
array_of_reviews = []

stars = {
  "1.0" => 0,
  "2.0" => 0,
  "3.0" => 0,
  "4.0" => 0,
  "5.0" => 0,
}

html_doc.css("ul.reviews > li").each do |review|
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
