module EventsHelper

	def days_left(event_object)
		daysRemain = (event_object.event_on - Time.now()).to_i
		oneDay = 86400000
		newDaysRemain = daysRemain*1000
		daysLeftOrComplete = newDaysRemain/86400000
		case 
		when daysLeftOrComplete > 1
		  #print('It is a string')
		  daysLeftOrComplete.to_s + ' Days Left'
		when daysLeftOrComplete == 1
		  #print('It is a number')
		  daysLeftOrComplete.to_s + ' Days Left'
		when daysLeftOrComplete == 0
		  #print('It is a number')
		  newDaysRemain = daysRemain*1000 + 19800
		  finalDaysRemain = newDaysRemain/(60*60*1000)
		  finalDaysRemain.to_s + ' Hours left.'
		when daysLeftOrComplete == -1
		  #print('It is a number')
		  newDaysRemain = (daysRemain*1000* -1) + 19800
		  finalDaysRemain = newDaysRemain/(60*60*1000)
		  finalDaysRemain.to_s + ' Hours ago.'
		else
		  #print('It is not a string')
		  daysLeftOrComplete = daysLeftOrComplete * - 1
		  daysLeftOrComplete.to_s + ' Days Completed'
		end

	end

end
