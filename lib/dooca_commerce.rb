require 'faraday'
require 'response_handler'

class DoocaCommerce

  def initialize(token:)
    @token = token
    @handler = ResponseHandler
  end

  attr_reader :token, :handler

  def fetch_products(query = {})
    response = connection.get("/products", query)

    handler.new(response).parse!
  end

  def fetch_product(query = {})
    response = connection.get("/products", query)

    handler.new(response, single_from_list: true).parse!
  end

  def fetch_variations(query = {})
    response = connection.get("/variations", query)

    handler.new(response).parse!
  end

  def fetch_variation(query = {})
    response = connection.get("/variations", query)

    handler.new(response, single_from_list: true).parse!
  end

  def update_stock_and_price(product_id:, body:)
    response = connection.put("/products/#{product_id}", body.to_json)

    handler.new(response).parse!
  end

  private

  URL = "https://api.dooca.store"

  def headers
    {
      "Content-Type" => "application/json",
      "Authorization": "Bearer #{token}"
    }
  end

  def connection
    @connection ||= Faraday.new(url: URL, headers: headers)
  end
end
