class parkingLot
	attr_accessor :slot
	def initialize(size)
		@slot = Array.new(size)
	end
	
	def avail_slot
		slot.each_with_index do |slot, idx|
			return idx if slot.nil?
		end
	
		nil
	end

	def park(car:, slot_num:)
		slot[slot_num] = car
	end

	def leave(slot_num)
		slot[slot_num] = nil
	end

