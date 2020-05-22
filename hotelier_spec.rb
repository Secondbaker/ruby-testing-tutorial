require 'rspec'

class Hotel
    attr_accessor :guests

    def initialize
        @guests = []
    end

    def check_in_guest(guest_name, room_number)
        @guests << guest_name
    end
    
    def check_out_guest(guest_name)
        @guests.delete(guest_name)
    end

    def vacant_room_count

    end
end

describe Hotel do 
    it 'can check in a guest' do
        hotel = Hotel.new
        hotel.check_in_guest('George Harrison', 302)
        expect(hotel.guests).to include 'George Harrison'
    end

    it 'can check out a guest' do
        hotel = Hotel.new
        hotel.check_in_guest('Ringo Starr', 401)
        hotel.check_out_guest('Ringo Starr')
        expect(hotel.guests).to_not include 'Ringo Starr'
    end

    it 'cannot check two guests into the same room' do
        hotel = Hotel.new
        hotel.check_in_guest('Masafumi Gotoh', 221)
        hotel.check_in_guest('Ryuichi Sakamoto', 221)
        expect(hotel.guests).to_not include 'Ryuichi Sakamoto'
    end

    it 'decreases total number of available rooms when a guest is checked in' do
        hotel = Hotel.new
        start_room_count = hotel.vacant_room_count
        hotel.check_in_guest('Rivers Cuomo', 253)
        end_room_count = hotel.vacant_room_count
        expect(end_room_count).to eq(start_room_count - 1)
    end
end