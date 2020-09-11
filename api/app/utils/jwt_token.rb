require 'jwt'
class JwtToken
    def self.encode(payload)
        JWT.encode(payload, ENV['JWT_SECRET'] || "secret")
    end

    def self.decode(token)
        begin
            payload, header = JWT.decode(token, ENV['JWT_SECRET'] || "secret")
            payload
        end
    end
end