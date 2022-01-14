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

  def fetch_categories(query = {})
    response = connection.get("/categories", query)

    handler.new(response).parse!
  end

  def fetch_category(category_id:)
    response = connection.get("/categories/#{category_id}")

    handler.new(response).parse!
  end

  def fetch_colors(query = {})
    response = connection.get("/colors", query)

    handler.new(response).parse!
  end

  def fetch_brands(query = {})
    response = connection.get("/brands", query)

    handler.new(response).parse!
  end

  def fetch_attributes(query = {})
    response = connection.get("/attributes", query)

    handler.new(response).parse!
  end

  def create_product(body)
    response = connection.post("/products", body.to_json)

    handler.new(response).parse!
  end

  def update_product(product_id:, body:)
    response = connection.put("/products/#{product_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_variation(body)
    response = connection.post("/variations", body.to_json)

    handler.new(response).parse!
  end

  def update_variation(variation_id:, body:)
    response = connection.put("/variations/#{variation_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_category(body)
    response = connection.post("/categories", body.to_json)

    handler.new(response).parse!
  end

  def update_category(category_id:, body:)
    response = connection.put("/categories/#{category_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_brand(body)
    response = connection.post("/brands", body.to_json)

    handler.new(response).parse!
  end

  def update_brand(brand_id:, body:)
    response = connection.put("/brands/#{brand_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_color(body)
    response = connection.post("/colors", body.to_json)

    handler.new(response).parse!
  end

  def update_color(color_id:, body:)
    response = connection.put("/colors/#{color_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_attribute(body)
    response = connection.post("/attributes", body.to_json)

    handler.new(response).parse!
  end

  def update_attribute(attribute_id:, body:)
    response = connection.put("/attributes/#{attribute_id}", body.to_json)

    handler.new(response).parse!
  end

  def create_attribute_value(body)
    response = connection.post("/attributes/values", body.to_json)

    handler.new(response).parse!
  end

  def update_attribute_value(attribute_value_id:, body:)
    response = connection.put("/attributes/values/#{attribute_value_id}", body.to_json)

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
