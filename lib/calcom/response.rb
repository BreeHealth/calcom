# frozen_string_literal: true

module Calcom
  class Response
    attr_reader :http_response, :content, :errors

    def initialize(http_response)
      @http_response = http_response
      @errors = []
      @content = safe_parse(http_response.body)
    end

    def successful?
      http_response.is_a?(Net::HTTPSuccess) && errors.empty?
    end

    def status_code
      http_response.code
    end

    private

    def safe_parse(body)
      return unless body

      JSON.parse(body, symbolize_names: true)
    rescue JSON::ParserError
      @errors << InvalidResponseError.new('Invalid JSON response')
      nil
    end
  end
end
