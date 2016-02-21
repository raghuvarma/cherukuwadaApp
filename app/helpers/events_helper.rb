module EventsHelper

	def days_left(event_object)
		daysRemain = (event_object.event_on - Time.now()).to_i
		oneDay = 86400000
		newDaysRemain = daysRemain*1000
		daysLeftOrComplete = newDaysRemain/86400000
		if daysLeftOrComplete
			case 
			when daysLeftOrComplete > 1
				(daysLeftOrComplete).ceil.to_s + ' Days Left'
			when daysLeftOrComplete == 1
				(daysLeftOrComplete).ceil.to_s + ' Days Left'
			when daysLeftOrComplete == 0
				newDaysRemain = daysRemain*1000 + 19800
				finalDaysRemain = newDaysRemain/(60*60*1000)
				(finalDaysRemain).ceil.to_s + ' Hours left.'
			when daysLeftOrComplete == -1
				newDaysRemain = (daysRemain*1000* -1) + 19800
				finalDaysRemain = newDaysRemain/(60*60*1000)
				(finalDaysRemain).ceil.to_s + ' Hours ago.'
			else
				daysLeftOrComplete = daysLeftOrComplete * - 1
				(daysLeftOrComplete).ceil.to_s + ' Days Completed'
			end
		end

	end

end
