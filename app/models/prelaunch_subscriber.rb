class PrelaunchSubscriber < ActiveRecord::Base
  validates_presence_of :email, :message => 'Please enter your email address first.'
  validates_uniqueness_of :email, :message => 'That email is already on the list.'
  validates_format_of :email,
    :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    :message => 'That email address doesn\'t look right.'

  after_save :add_to_campaign_monitor, :if => :campaign_monitor_configured?

  private

  def add_to_campaign_monitor
    list_id = ENV[:CAMPAIGN_MONITOR_LIST_ID]
    CreateSend::Subscriber.add(list_id, email, "", [], true)
  end

  def campaign_monitor_configured?
    ENV[:CAMPAIGN_MONITOR_API_KEY].present? &&
    ENV[:CAMPAIGN_MONITOR_LIST_ID].present?
  end
end
