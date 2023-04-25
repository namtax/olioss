module Normalizers
  class Article 
    def initialize(input)    
      @input = input.deep_symbolize_keys
    end

    def to_h
      { 
        id: id,
        title: title,
        description: description, 
        donation_description: donation_description, 
        collection_id: collection_id, 
        section: section, 
        location: location, 
        collection_notes: collection_notes, 
        value: value, 
        status: status,
        expiry: expiry,
        reactions: reactions, 
        is_owner: is_owner, 
        conversations: conversations,
        photos: photos, 
        user_id: user_id,
        created_at: created_at, 
        updated_at: updated_at,
      }
    end

    private

    def collection_id
      @input[:collection][:id]
    end

    def user_id
      @input[:user][:id]
    end

    def method_missing(*args)
      @input[*args]
    end
  end
end