require "rss"
require "open-uri"

class Feed < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true

  def get_items
    titles = []

    open(self.url) do |rss|
      parsed_feed = RSS::Parser.parse(rss)
      parsed_feed.items.sort_by! {|item| item.pubDate}
      parsed_feed.items.first(10).each do |item|
        titles << {item.title => item.url}
      end
    end
    titles
  end
end
