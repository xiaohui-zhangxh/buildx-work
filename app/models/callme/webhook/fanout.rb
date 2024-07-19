module Callme::Webhook::Fanout
  extend ActiveSupport::Concern

  def fanout(params)
    fanout = Callme::Webhook::Fanouts.const_get(fanout_type.to_s.camelize).new(self)
    info = Callme::Webhook::Hooks.const_get(hook_type.to_s.camelize).new(params).hook
    return info unless info[:success] && info[:message].present?

    fanout.run(info[:message])
  end
end
