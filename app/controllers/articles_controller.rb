# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :store_articles, only: [:index]

  def index
    @articles = Article.all.order(:updated_at).page params[:page]
  end

  def update 
    article = Article.find(params[:id])
    UpdateLikes.run(article.id)
    article.reload.likes

    respond_to do |format|
      format.js { render json: { likes: article.likes }, status: :ok }
    end
  end

  private

  def store_articles
    resp = Clients::ArticlesClient.get
    Store.run(resp)
  end
end
