class HomesController < ApplicationController

  def top
  end

  def news
   agent = Mechanize.new
   page = agent.get("https://hobby.dengeki.com/tag/gunpla-2/") #urlの情報取得
   @elements = page.at('div.topnews')  #atメソッドでdivクラスのtopnews内の情報を指定
   @elements = @elements.css('.ttlB').children  #cssメソッドでttlbの子要素を取得
  end

end
