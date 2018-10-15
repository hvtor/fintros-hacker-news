require "httparty"

class ArticlesController < ApplicationController
  def index
  	@articles = ArticleCache.retrieve(30,0)
  end

  def load_articles
    # TODO: remember strong params
    @articles = ArticleCache.retrieve(30, params["n"])
  end
end