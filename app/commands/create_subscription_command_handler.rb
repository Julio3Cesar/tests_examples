class CreateSubscriptionCommandHandler
  attr_reader :subscription

  def initialize(subscription:)
    @subscription = subscription
  end

  def execute()
    SubscriptionRepository.persist(@subscription)
  end
end
