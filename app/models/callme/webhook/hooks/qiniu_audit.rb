class Callme::Webhook::Hooks::QiniuAudit
  def self.example
    {
      inputBucket: "example-bucket",
      inputKey: "foobar.jpg",
      items: [
        {
          result: {
            result: {
              suggestion: "block"
            }
          }
        }
      ]
    }
  end

  def initialize(params)
    @params = params
  end

  def hook
    result = parse_result(@params.deep_stringify_keys)
    return unless result[:bucket].present? && result[:key].present? && report?(result[:suggestion])

    "#{result[:suggestion]} [#{result[:bucket]}] => /#{result[:key]} ，原因: #{result[:desc].join('，')}"
  end

  private

    def parse_result(params)
      result = {
        bucket: params['inputBucket'],
        key: params['inputKey'],
        desc: [],
      }

      if params.key?('items') && params['items'].is_a?(Array)
        params['items'].each do |item|
          suggestion = item.dig('result', 'result', 'suggestion')
          result[:suggestion] = [result[:suggestion], suggestion].max(&suggestion_weight)
          item.dig('result', 'result', 'scenes').each_pair do |type, value|
            desc = value.dig('result', 'desc')
            result[:desc] = (result[:desc] + [desc]).compact.uniq if desc
          end
        end
      end

      result
    end

    def suggestion_weight
      proc { |a, b| (%w[pass review block].index(a) || -1) <=> (%w[pass review block].index(b) || -1) }
    end

    def report?(suggestion)
      %w[review block].include?(suggestion)
    end
end
