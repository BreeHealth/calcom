# frozen_string_literal: true

require 'calcom/rest/bookings'

module Calcom
  class Rest
    # API v1
    include Calcom::Rest::Bookings
    # include Calcom::Rest::Availabilities
    # include Calcom::Rest::Users

    def initialize(client)
      @client = client
    end

    private

    attr_reader :client
  end
end
