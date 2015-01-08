class NokoLoader
  def initialize(file)
    @file = file
  end

  def loader
    f = File.open(@file)
    doc = Nokogiri::HTML(f)
    f.close
    doc
  end

  def get_review

  end
end
