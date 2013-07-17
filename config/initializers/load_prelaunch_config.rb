campaign_monitor_api_key = ENV['CAMPAIGN_MONITOR_API_KEY']
CreateSend.api_key(campaign_monitor_api_key) if campaign_monitor_api_key.present?

['CAMPAIGN_MONITOR_API_KEY', 'CAMPAIGN_MONITOR_LIST_KEY'].each do |e|
  unless ENV[e].present?
    puts "Missing environment variable: #{e}"
  end
end


