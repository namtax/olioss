class ArticlesController < ApplicationController
  before_action :store_articles, only: [:index]

  def index
    @articles = Article.all
  end

  def store_articles
    resp = Clients::ArticlesClient.get
    Store.run(resp)
  end
end
