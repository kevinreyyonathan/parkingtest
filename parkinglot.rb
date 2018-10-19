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

	

