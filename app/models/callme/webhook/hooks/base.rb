class Callme::Webhook::Hooks::Base
  def initialize(params, headers)
    @params = params
    @headers = headers
  end

  def hook
    raise NotImplementedError
  end

  private

    def response_message(success = true, message = nil)
      { success:, message: }
    end
end
