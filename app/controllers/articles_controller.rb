class ArticlesController < ApplicationController
  @@page_size = 30
  def index
  	@articles = ArticleCache.retrieve(@@page_size,0)
    @next_article = @@page_size
  end

  def load_articles
    # TODO: remember strong params
    @next_article = (params["next_article"] || 0).to_i
    @articles = ArticleCache.retrieve(@@page_size, @next_article)
    @next_article += @@page_size
    render partial: "articles"
  end
end