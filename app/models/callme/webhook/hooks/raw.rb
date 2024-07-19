class Callme::Webhook::Hooks::Raw < Callme::Webhook::Hooks::Base
  def self.example
    {
      "message" => "hello"
    }
  end

  def hook
    response_message true, @params['message']
  end
end
