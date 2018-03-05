require 'wombat'

 result = Wombat.crawl do
  base_url "http://rubyconferences.org"
  path "/past"

  headline "xpath=//h1"
  videos "css=#past>dl>dd>ul>li[last()]", :iterator do
    name({xpath: ".//a[1]"})
    url({xpath: ".//a[1]/@href"})
  end
end

p  result