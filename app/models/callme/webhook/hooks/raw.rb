class Callme::Webhook::Hooks::Raw
  def self.example
    {
      message: "hello"
    }
  end

  def initialize(params)
    @params = params
  end

  def hook
    return unless @params[:message].present?

    @params[:message]
  end
end
