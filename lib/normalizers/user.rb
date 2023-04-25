module Normalizers
  class User
    def initialize(input)    
      @input = input.deep_symbolize_keys[:user]
    end

    def to_h
      { 
        id: id, 
        first_name: first_name, 
        current_avatar: current_avatar,
        roles: roles, 
        location: location, 
        rating: rating, 
        verifications: verifications
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