# frozen_string_literal: true

module Calcom
  class Client
    def initialize(api_key: nil)
      @base_uri = URI.parse(Calcom.configuration.api_url)
      @api_key = api_key || Calcom.configuration.api_key
    end

    def get(path:, query: nil)
      request(method: :get, path: path, query: query)
    end

    def post(path:, body: nil)
      request(method: :post, path: path, body: body)
    end

    def put(path:, body: nil)
      request(method: :put, path: path, body: body)
    end

    def patch(path:, body: nil)
      request(method: :patch, path: path, body: body)
    end

    def delete(path:)
      request(method: :delete, path: path)
    end

    private

    attr_reader :base_uri, :api_key

    def request(method:, path:, body: nil, query: nil)
      uri_with_path = uri_for(path, query)
      Request.call(method: method, uri: uri_with_path, body: body, api_key: api_key)
    end

    def uri_for(path, _query = nil)
      uri = base_uri.dup
      uri.path = path
      uri
    end
  end
end
