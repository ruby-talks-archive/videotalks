# https://github.com/felipecsl/wombat/wiki
# Using class method
# Not working, error: uninitialized constant RubyConferenceVideoScraper::Wombat(NameError)
class RubyConferenceVideoScraper
  include Wombat::Crawler
  
  base_url "http://rubyconferences.org"
  path "/past"

  headline "xpath=//h1"
  videos "css=#past>dl>dd>ul>li[last()]", :iterator do
    name({xpath: ".//a[1]"})
    url({xpath: ".//a[1]/@href"})
  end
end


video_scraper = RubyConferenceVideoScraper.new

video_scraper.crawl