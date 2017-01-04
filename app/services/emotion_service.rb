require 'uri'
require 'net/http'

class EmotionService
  def initialize(image)
    @image = image
  end

  def get_emotion_data
    uri = URI("https://api.projectoxford.ai/emotion/v1.0/recognize")
    uri.query = URI.encode_www_form({
                  })

    request = Net::HTTP::Post.new(uri.request_uri)

    request["content-type"] = 'application/octet-stream'
    request["ocp-apim-subscription-key"] = ENV["microsoft_key"]
    read_file = File.read(@image)
    request.body = read_file

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
