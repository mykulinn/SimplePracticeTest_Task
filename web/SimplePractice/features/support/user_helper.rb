
module Helpers
  class DataHelper
    @@users = { "admin": {username: "somab63683@lewenbo.com", password: "GoodLuck777"} }
    @@feature_variables = {}

    def self.users
      @@users
    end

    def self.feature_variables
      @@feature_variables
    end
  end
end
