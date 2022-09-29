# frozen_string_literal: true

module Calcom
  class Request
    def self.call(**args, &block)
      new(**args, &block).call
    end

    def initialize(method:, uri:, body: nil, api_key: nil)
      @method = method
      @uri = uri
      @request = request_class.new(uri).tap do |req|
        req['Accept']         = 'application/json'
        req['Content-Type']   = 'application/json'
        req['Authorization']  = "apiKey #{api_key}" if api_key
        req.body = body if body
      end
    end

    def call
      response = Net::HTTP.start(uri.host, uri.port, use_ssl.true) do |http|
        http.request(request)
      end
      Response.new(response)
    end

    private

    attr_reader :request, :method, :uri

    def request_class
      case method
      when :get
        Net::HTTP::Get
      when :post
        Net::HTTP::Post
      when :put
        Net::HTTP::Put
      when :patch
        Net::HTTP::Patch
      when :delete
        Net::HTTP::Delete
      else
        raise InvalidRequestError
      end
    end
  end
end
