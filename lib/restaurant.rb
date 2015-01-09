class Restaurant
  attr_accessor :health_score, :also_viewed
  def initialize(yelp_page)
    @yelp_page = yelp_page
    @health_score = yelp_page.css("div.score-block").text.strip
    @also_viewed = find_also_viewed
  end

  def find_also_viewed
    also_viewed_array = @yelp_page.css("div.related-businesses li").map do |other_restaurant|
      linky = other_restaurant.css("a").attr('href').text
    end
  end
end
