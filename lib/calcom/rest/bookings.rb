# frozen_string_literal: true

module Calcom
  class Rest
    module Bookings
      # GET /v1/bookings
      def find_all_bookings
        client.get(path: '/v1/bookings')
      end

      # POST /v1/bookings
      def create_booking(payload = {})
        client.post(path: '/v1/bookings', body: payload.to_json)
      end

      # GET /v1/bookings/{id}
      def find_booking(id)
        client.get(path: "/v1/bookings/#{id}")
      end

      # PATCH /v1/bookings/{id}
      def update_booking(id, payload = {})
        client.patch(path: "/v1/bookings/#{id}", body: payload.to_json)
      end

      # DELETE/v1/bookings/{id}
      def delete_booking(id)
        client.delete(path: "/v1/bookings/#{id}")
      end
    end
  end
end
