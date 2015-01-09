class Restaurant
  attr_accessor :health_score
  def initialize(yelp_page)
    @health_score = yelp_page.css("div.score-block").text.strip
  end
end
