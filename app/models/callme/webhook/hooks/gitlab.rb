class Callme::Webhook::Hooks::Gitlab < Callme::Webhook::Hooks::Base
  def self.example
    {
      message: "hello"
    }
  end

  def hook
    return response_message(false, 'invalid request') if @params['object_kind'].blank?

    method = :"#{@params['object_kind']}_hook"
    return response_message(true) unless respond_to?(method, true)

    response_message true, send(method, @params)
  end

  private

    def push_hook(params)
      info = {
        project_name: params.dig('project', 'name'),
      }
      "push: #{info[:project_name]}"
    end

    def pipeline_hook(params)
      info = {
        project_name: params.dig('project', 'name'),
        stages: params['object_attributes']['stages'],
        detailed_status: params['object_attributes']['detailed_status']
      }
      "pipeline: #{info[:project_name]} #{info[:stages].join(', ')} #{info[:detailed_status]}"
    end
end
