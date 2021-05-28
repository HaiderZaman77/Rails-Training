module Api
    class Base < Grape::API
      mount API::V1::Base
    end
end