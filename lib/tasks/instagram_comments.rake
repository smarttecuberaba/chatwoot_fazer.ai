namespace :instagram do
  desc 'Re-subscribe existing Instagram Login channels so the comments webhook field is enabled'
  task resubscribe_comments: :environment do
    count = 0
    Channel::Instagram.find_each do |channel|
      channel.subscribe
      count += 1
      Rails.logger.info("Re-subscribed Instagram channel ##{channel.id} (#{channel.instagram_id})")
    end
    Rails.logger.info("Done. Re-subscribed #{count} Instagram channel(s) to include `comments`.")
  end
end
