class UpdateLikes 
  def self.run(article_id) 
    article = Article.find(article_id)

    if article.likes.zero?
      article.update(reactions: {
        likes: 1,
        by_user: false,
      })
    else
      article.reactions['likes'] += 1
      article.save
    end
  end
end