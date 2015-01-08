class Review
  attr_accessor :content, :date, :star_count, :author, :text, :html
  def initialize(content)
    @content = content.css("ul.reviews").css('li')[0]
    @date = @content.css('.review-content meta[itemprop="datePublished"]').attr("content").text
    @star_count = @content.css('.review-content meta[itemprop="ratingValue"]').attr("content").text
    @author = @content.css('li.user-name').text.strip
    @text = @content.css(".review-content p").text
    @html = @content.to_html
  end

  def five_star?
    return true if @star_count == "5.0"
  end
end
