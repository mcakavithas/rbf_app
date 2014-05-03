class EventsController < ApplicationController::Base
load_and_authorize_resource
 
def update
# UGH!
if @event.status != params[:event][:status]
authorize! :perform, EventStatusChange.new(@event, params[:event][:status])
end

if @event.status != params[:event][:status]
unless current_user.admin? || ["pending approval"].include?(params[:event][:status])
render status: :unauthorized and return
end

end

end
