module EventsHelper

	def days_left(event_object)
		daysRemain = (event_object.event_on - Time.now()).to_i
		oneDay = 86400000
		newDaysRemain = daysRemain*1000
		daysLeftOrComplete = newDaysRemain/86400000
		case 
		when daysLeftOrComplete > 1
		  #print('It is a string')
		  Math.ceil(daysLeftOrComplete) + ' Days Left'
		when daysLeftOrComplete == 1
		  #print('It is a number')
		  Math.ceil(daysLeftOrComplete) + ' Days Left'
		when daysLeftOrComplete == 0
		  #print('It is a number')
		  newDaysRemain = daysRemain*1000 + 19800
		  finalDaysRemain = newDaysRemain/(60*60*1000)
		  Math.ceil(finalDaysRemain) + ' Hours left.'
		when daysLeftOrComplete == -1
		  #print('It is a number')
		  newDaysRemain = (daysRemain*1000* -1) + 19800
		  finalDaysRemain = newDaysRemain/(60*60*1000)
		  Math.ceil(finalDaysRemain) + ' Hours ago.'
		else
		  #print('It is not a string')
		  daysLeftOrComplete = daysLeftOrComplete * - 1
		  Math.ceil(daysLeftOrComplete) + ' Days Completed'
		end

	end

end
