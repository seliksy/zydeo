require 'active_support/concern'

module VideosManager
  extend ActiveSupport::Concern

  def fetch_videos
    videos = @client.request(:get,
                    'https://api.zype.com/videos',
                    { params: { app_key: Rails.application.credentials[:app_key] } }
    )
    videos.body
  end

  def get_video(video_id)
    videos = @client.request(:get,
                    'https://api.zype.com/videos/'+video_id,
                    { params: { app_key: Rails.application.credentials[:app_key] } }
    )
    videos.body
  end
end
