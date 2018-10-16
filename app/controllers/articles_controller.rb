class ArticlesController < ApplicationController
  @@page_size = 5
  def index
  	@articles = ArticleCache.retrieve(30,0)
    @next_article = @@page_size
  end

  def load_articles
    # TODO: remember strong params
    @next_article = params["next-article"] || 0
    @articles = ArticleCache.retrieve(30, @next_article)
    @next_article += @@page_size
    render html: "articles"
  end
end