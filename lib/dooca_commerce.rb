require 'faraday'

class DoocaCommerce

  def initialize(token:)
    @token = token
  end

  def fetch_products(query: nil)
    response = Faraday.get("#{URL}/products", query, header)

    parse_response(response)

    self
  end

  private

  URL = "https://api.dooca.store"

  attr_reader :token, :body, :status

  def parse_response(response)
    @body = JSON.parse(response.body).deep_symbolize_keys
    @status = response.status
  end

  def header
    {"Authorization": "Bearer #{token}"}
  end
end
