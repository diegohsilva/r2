json.extract! post, :id, :title, :description, :url_image, :size_image, :key_youtube, :size_video, :created_at, :updated_at
json.url post_url(post, format: :json)
