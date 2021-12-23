class ResponseHandler

  def initialize(response, list: false)
    @response = response
    @list = list
  end

  attr_reader :response, :list

  def parse!
    success? ? handle_success : handle_error
  end

  private

  def handle_success
    @payload = payload.data.first if payload.data.present? && !list

    payload.success = true

    payload
  end

  def handle_error
    payload.success = false

    payload
  end

  def payload
    @payload ||= JSON.parse(response.body, object_class: OpenStruct)
  end

  def success?
    response.status == 200
  end
end
