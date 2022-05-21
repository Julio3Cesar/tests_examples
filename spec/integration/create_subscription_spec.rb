require 'rails_helper'
require 'securerandom'

describe 'create subscription', type: :model do
  after(:context) do
    File.write('subscription_db', '', mode: 'w')
  end

  context 'when the subscription is valid' do
    # Setup
    subscription_id = SecureRandom.uuid
    valid_subscription = Subscription.new(id: subscription_id, period: 1, valid_periods: [1, 12])

    # Execution
    CreateSubscriptionCommandHandler.new(subscription: valid_subscription).execute()

    # Expectations
    it 'create a subscription' do
      subscription = YAML.load(File.open('subscription_db'))
      expect(subscription.id).to eq(subscription_id)
    end
  end
end
