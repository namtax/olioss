class Store
  def self.run(input)
    resp   = JSON.parse(input)
    a_resp = resp.map(&Normalizers::Article.method(:new)).map(&:to_h)
    Article.upsert_all(a_resp)

    u_resp = resp.map(&Normalizers::User.method(:new)).map(&:to_h).uniq
    User.upsert_all(u_resp)
  end
end
