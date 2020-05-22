require 'rspec'

class Hotel
    attr_accessor :guests

    def initialize
        @guests = []
    end

    def check_in_guest(guest_name)
        @guests << guest_name
    end
end

describe Hotel do 
    it 'can check in a guest' do
        hotel = Hotel.new
        hotel.check_in_guest('George Harrison')
        expect(hotel.guests).to include 'George Harrison'
    end
end