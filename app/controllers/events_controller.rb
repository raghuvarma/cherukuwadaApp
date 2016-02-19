class EventsController < InheritedResources::Base

  private

    def event_params
      params.require(:event).permit(:name, :description, :event_on, :is_repeated, :type)
    end
end

