require 'rails_helper'

describe '#change_periodicity', type: :model do
  context 'when the subscription is not yearly but can be yearly' do
    # Setup
    subscription_id = SecureRandom.uuid
    monthly_subscription = Subscription.new(id: subscription_id, period: 1, valid_periods: [1, 12])

    # Execution
    monthly_subscription.change_periodicity(period: 12)

    # Expectations
    it 'changes periodicity to annually' do
      expect(monthly_subscription.period).to eq(12)
    end
  end

  context 'when the subscription is not quarterly but can be quarterly' do
    # Setup
    subscription_id = SecureRandom.uuid
    monthly_subscription = Subscription.new(id: subscription_id, period: 1, valid_periods: [1, 3])

    # Execution
    monthly_subscription.change_periodicity(period: 3)

    # Expectations
    it 'does change periodicity to quarterly' do
      expect(monthly_subscription.period).to eq(3)
    end
  end

  context 'when the subscription is already monthly' do
    # Setup
    subscription_id = SecureRandom.uuid
    monthly_subscription = Subscription.new(id: subscription_id, period: 1, valid_periods: [1])

    # Execution
    monthly_subscription.change_periodicity(period: 1)

    # Expectations
    it 'does not change the subscription period' do
      expect(monthly_subscription.period).to eq(1)
    end
  end

  context 'when the subscription can not be biannual' do
    # Setup
    subscription_id = SecureRandom.uuid
    monthly_subscription = Subscription.new(id: subscription_id, period: 1, valid_periods: [1, 12])

    # Execution && Expectations
    it 'raise an exeception with the valid periods within a message' do
      expect { monthly_subscription.change_periodicity(period: 24) }.to raise_error(/[1, 12]/)
    end

    it 'does not change the subscription period' do
      expect(monthly_subscription.period).to eq(1)
    end
  end
end
