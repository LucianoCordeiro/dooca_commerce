require 'faraday'
require 'response_handler'

class DoocaCommerce

  def initialize(token:)
    @token = token
    @handler = ResponseHandler
  end

  attr_reader :token, :handler

  def fetch_products(query = {})
    response = Faraday.get("#{URL}/products", query, header)

    handler.new(response, list: true).parse!
  end

  def fetch_product(query = {})
    response = Faraday.get("#{URL}/products", query, header)

    handler.new(response).parse!
  end

  def fetch_variations(query = {})
    response = Faraday.get("#{URL}/variations", query, header)

    handler.new(response, list: true).parse!
  end

  def fetch_variation(query = {})
    response = Faraday.get("#{URL}/variations", query, header)

    handler.new(response).parse!
  end

  def update_stock_and_price(product_id:, body:)
    response = Faraday.put("#{URL}/products/#{product_id}", body.to_json, header)

    handler.new(response).parse!
  end

  private

  URL = "https://api.dooca.store"

  def header
    {"Authorization": "Bearer #{token}"}
  end
end
