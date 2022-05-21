require 'yaml'

class SubscriptionRepository

  def self.persist(subscription)
    File.write('subscription_db', subscription.to_yaml, mode: 'a')
  end
end
