class EventStatusChange
attr_reader :event, :new_status
 
def initialize(event, new_status)
@event = event
@new_status = new_status
end
end