json.array!(@videos) do |video|
  json.extract! video, :id, :url, :vid_lat, :vid_lng, :vid_date, :vid_time, :email, :phone, :notes
  json.url video_url(video, format: :json)
end
