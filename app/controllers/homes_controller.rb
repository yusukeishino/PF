class HomesController < ApplicationController

  def top
  end

  def news
   #@agent = Mechanize.new
   #@page = @agent.get("https://hobby.dengeki.com/tag/gunpla-2/")
   #@elements = @page.search('div.topnews')
   agent = Mechanize.new
   page = agent.get("https://hobby.dengeki.com/tag/gunpla-2/")
   @elements = page.at('div.topnews')
   # elements.css('.ttlB').children.first.attributes['href'].value
   # @elements.class
   # @elements.methods
   # @elements.css('.ttlB').methods
   @elements = @elements.css('.ttlB').children
  end

end
