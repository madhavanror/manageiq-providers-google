module ManageIQ::Providers::Google::CloudManager::EventParser
  extend ManageIQ::Providers::Google::EventCatcherMixin

  def self.event_to_hash(event, ems_id)
    log_header = "ems_id: [#{ems_id}] " unless ems_id.nil?

    event_type = parse_event_type(event)

    _log.debug { "#{log_header}event: [#{event_type}]" }

    event_hash = {
      :event_type => event_type,
      :source     => "GOOGLE",
      :message    => event_type,
      :timestamp  => event['timestamp'],
      :full_data  => event,
      :ems_id     => ems_id
    }

    event_hash
  end
end
