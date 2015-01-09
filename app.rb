require 'Nokogiri'
require 'RestClient'
require_relative './lib/review'
require_relative './lib/restaurant'
require_relative './lib/health_crawler.rb'

host_url = 'http://www.yelp.com'

url_to_scrape_from = '/biz/mcdonalds-berkeley-4'

file = RestClient.get(host_url + url_to_scrape_from, user_agent: "Chrome")

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

# p stars
#
 first_review = array_of_reviews.first
# p first_review.date
# p first_review.star_count
 p first_review.author
# p first_review.text
# p first_review.five_star?


restaurant = Restaurant.new(html_doc)

p restaurant.health_score

p restaurant.also_viewed

healthy_restaurant = HealthCrawler.new(url_to_scrape_from, host_url)

p healthy_restaurant.search
