module RequestsHelper
  module JsonHelpers
    def parsed_response
      @json ||= parsed_body(response_body)
    end

    def parsed_body(body)
      JSON.parse(body) || {}
    end
  end
end
