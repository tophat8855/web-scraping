require 'nokogiri'
require 'rest-client'

class HealthCrawler
  def initialize(initial_restaurant, host)
    @queue = [initial_restaurant]
    @host = host
  end

  def search
    until @queue.empty?
      current_url = @queue.shift

      puts "Current url is #{current_url}"
      current_state = url_to_nokogiri(@host + current_url)

      if health_score(current_state) == 100
        return current_url
      else
        expand current_state
      end
    end
    return nil
  end

  private
  def expand(state)
    name = state.css('h1.biz-page-title').text.strip
    p "Expanding #{name}"
    similar_states = find_also_viewed(state)
    @queue.concat(similar_states)
  end

  def find_also_viewed(state)
    also_viewed_array = state.css("div.related-businesses li").map do |other_restaurant|
      linky = other_restaurant.css("a").attr('href').text
    end
  end

  def url_to_nokogiri(url)
    response = RestClient.get(url, :user_agent => 'Chrome')
    Nokogiri::HTML(response.body)
  end

  def health_score(state)
    score = state.css("div.score-block").text.strip.to_i
  end

end
