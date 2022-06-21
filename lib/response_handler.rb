class ResponseHandler

  def initialize(response, single_from_list: false)
    @response = response
    @single_from_list = single_from_list
  end

  attr_reader :response, :single_from_list

  def parse!
    success? ? handle_success : handle_error
  end

  private

  def handle_success
    @payload = payload.data.first if single_from_list

    payload.success = true

    payload
  end

  def handle_error
    payload.success = false

    payload
  end

  def payload
    @payload ||= JSON.parse(response.body.presence || "{}", object_class: OpenStruct)
  end

  def success?
    single_from_list ? payload.data&.first.present? : (200..204).include?(response.status)
  end
end
