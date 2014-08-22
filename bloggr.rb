gem 'nokogiri'

require 'nokogiri'
require 'open-uri'
require 'time'
require 'fileutils'

def force_ascii(text)
  text.encode(Encoding.find('ASCII'), invalid: :replace, undef: :replace, replace: '')
end

def remove_newlines(text)
  text.gsub(/^\n$/, "")
end

def clean_node(node)
  # If it's text then we're done with this tree, so just return the text.
  return node if node.name == "text"

  # Clean this node's children
  node.children.each { |n| clean_node(n) }

  # Remove simple_socialmedia divs
  if node.attributes['id'] && node['id'].match(/simple_socialmedia/)
    node.remove
    return
  end

  # Remove empty tags
  if %w[ p h1 h2 h3 h4 h5 h6 h7 div span strong em ].include?(node.name) &&
  (
    node.children.empty? ||
    ( node.children.all? { |n| n.name == "text" } && force_ascii(node.content).strip.empty? )
  )
    node.remove
    return
  end

  # Delete unwanted attributes
  %w[ style class id align ].each { |a| node.remove_attribute(a) }

  return node
end


month_urls  = []
post_urls   = []
posts       = []

url = "http://lapressclub.org/archives/"
doc = Nokogiri::HTML(open(url))

doc.css(".archives-page ul:first-of-type li a").each do |link|
  month_urls << link['href']
end

month_urls.each do |url|
  doc = Nokogiri::HTML(open(url))

  doc.css("div.post-headline h2 a").each do |link|
    post_urls << link['href']
  end
end

post_urls.each do |url|
  doc       = Nokogiri::HTML(open(url))
  post_dom  = doc.at_css("#middle .post")

  headline  = post_dom.at_css('.post-headline').text.strip rescue "NO HEADLINE"

  footer    = post_dom.at_css(".post-footer").text.strip
  date      = Time.parse(footer[/^.+? \d+.., \d{4}/])

  tags      = Nokogiri::HTML::DocumentFragment.parse(footer.match(/Tags: +?(.+?) \|/)[1]).text.strip rescue ""
  category  = Nokogiri::HTML::DocumentFragment.parse(footer.match(/Category: +?(.+?)$/)[1]).text.strip rescue ""

  body      = post_dom.at_css('.post-bodycopy')
  body_raw  = body.to_html
  body_html = remove_newlines(force_ascii(clean_node(body).to_html))
  body_pt   = body.css('p').map(&:text).join("\n\n").strip


  posts << {
    :url          => url,
    :headline     => force_ascii(headline),
    :date         => date,
    :tags         => tags,
    :category     => category,
    :body_raw     => body_raw,
    :body_pt      => body_pt,
    :body_html    => body_html
  }
end


FileUtils.mkdir_p "posts/raw"
FileUtils.mkdir_p "posts/plaintext"
FileUtils.mkdir_p "posts/html"

def write_to_file(f, post, body_type)
  f.write "URL: " + post[:url]
  f.write "\n"
  f.write "DATE: " + post[:date].strftime("%B %-d, %Y")
  f.write "\n"
  f.write "TAGS: " + post[:tags]
  f.write "\n"
  f.write "CATEGORY: " + post[:category]
  f.write "\n\n"
  f.write post[:headline]
  f.write "\n"
  f.write "-----------------------------------------------"
  f.write "\n\n"
  f.write post[body_type]
end

posts.each do |post|
  filename = "#{post[:date].to_i}-"
  filename << post[:headline].gsub(/\W+/, "_")

  File.open("posts/raw/#{filename}.txt", "w+") do |f|
    write_to_file(f, post, :body_raw)
  end

  File.open("posts/plaintext/#{filename}.txt", "w+") do |f|
    write_to_file(f, post, :body_pt)
  end

  File.open("posts/html/#{filename}.txt", "w+") do |f|
    write_to_file(f, post, :body_html)
  end
end
