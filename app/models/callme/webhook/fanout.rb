module Callme::Webhook::Fanout
  extend ActiveSupport::Concern

  def fanout(params)
    fanout = Callme::Webhook::Fanouts.const_get(fanout_type.to_s.camelize).new(self)
    message = Callme::Webhook::Hooks.const_get(hook_type.to_s.camelize).new(params).hook

    return fanout.run(message)
  end
end
