require 'google_news'

client = GoogleNews::Client.new

client.search("Ruby", topic: "test").items.each do |item|
  puts item.title
end
