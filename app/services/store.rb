class Store
  def self.run(input)
    resp = JSON.parse(input)
    resp = resp.map(&Normalizers::Article.method(:new)).map(&:to_h)
    Article.upsert_all(resp)
  end
end
