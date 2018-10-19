class ParkingLot
	attr_accessor :slots
	def initialize(size)
		@slots = Array.new(size)
	end
	
	def avail_slot
		slots.each_with_index do |slot, idx|
			return idx if slot.nil?
		end
	
		nil
	end

	def park(car:, slot_num:)
		slots[slot_num] = car
	end

	def leave(slot_num)
		slots[slot_num] = nil
	end

	def get_reg_no_by_color(color)
		result=[]
		slots.each do |slot|
			next unless slot
			result << slot.reg_no if slot.color == color
		end

		result
	end

