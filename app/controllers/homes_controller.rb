class HomesController < ApplicationController

  def top
  end

  def news
   @agent = Mechanize.new
   @page = @agent.get("https://hobby.dengeki.com/")
   @elements = @page.search('a')
  end

end
