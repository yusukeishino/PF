class SearchController < ApplicationController
  def search
    @model = params['model']
    @content = params['content']
    @how = params['how']
    if @model == 'User'
      @users = search_for(@how, @model, @content)
    else
      @images = search_for(@how, @model, @content)
    end
  end

  private

  def match(model, content)
    if model == 'User'
      User.where(name: content)
    elsif model == 'HobbyImage'
      HobbyImage.where(body: content)
    end
  end

  def partical(model, content)
    if model == 'User'
      User.where('name LIKE?', "%#{content}%")
    elsif model == 'HobbyImage'
      HobbyImage.where('body LIKE?', "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end
