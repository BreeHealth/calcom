# frozen_string_literal: true

require 'net/http'
require 'json'
require 'calcom/configuration'
require 'calcom/version'
require 'calcom/request'
require 'calcom/response'
require 'calcom/client'
require 'calcom/rest'

module Calcom
  class Error < StandardError; end

  class InvalidRequestError < StandardError; end

  class InvalidResponseError < StandardError; end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.rest(api_key = nil)
    Rest.new(Client.new(api_key: api_key || configuration.api_key))
  end
end
