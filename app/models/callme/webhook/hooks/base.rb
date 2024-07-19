class Callme::Webhook::Hooks::Base
  def initialize(params)
    @params = params
  end

  def hook
    raise NotImplementedError
  end

  private

    def response_message(success = true, message = nil)
      { success:, message: }
    end
end
