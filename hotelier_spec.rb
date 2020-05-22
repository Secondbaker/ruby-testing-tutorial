require 'rspec'

class Hotel
    attr_accessor :guests

    def initialize
        @guests = []
        @occupied_rooms = []
    end

    def check_in_guest(guest_name, room_number)      
        return false if @occupied_rooms.include?(room_number)
        @guests << guest_name
        @occupied_rooms << room_number
        true
    end
    
    def check_out_guest(guest_name, room_number)
        @guests.delete(guest_name)
        @occupied_rooms.delete(room_number)
    end

    def room_is_vacant?(room_number)
        !@occupied_rooms.include?(room_number)
    end

    def vacant_room_count

    end
end

describe Hotel do 

    let(:hotel) { Hotel.new }
    describe 'Checking in a guest' do
        it 'adds the guest to the guest list' do
            hotel.check_in_guest('Jack Fliegler', 105)
            expect(hotel.guests).to include 'Jack Fliegler'
        end

        context 'room is available' do
            it 'allows check-in' do
                expect(hotel.check_in_guest('George Harrison', 302)).to be true
            end
        end

        context 'room is not available' do
            it 'does not allow check-in' do
                hotel.check_in_guest('Masafumi Gotoh', 221)
                expect(hotel.check_in_guest('Ryuichi Sakamoto', 221)).to be false
            end

            it 'does not add guest to guest list' do
                hotel.check_in_guest('Jules Conroy', 405)
                hotel.check_in_guest('Jimi Hendrix', 405)
                expect(hotel.guests).to_not include 'Jimi Hendrix'
            end
        end
    end

    describe 'Checking out a guest' do
        it 'removes the guest from the hotel\'s guest list' do
            hotel.check_in_guest('Ringo Starr', 401)
            hotel.check_out_guest('Ringo Starr', 401)
            expect(hotel.guests).to_not include 'Ringo Starr'
        end

        it 'opens a room' do
            hotel.check_in_guest('Christophe Blondel', 104)
            hotel.check_out_guest('Christophe Blondel', 104)
            expect(hotel.room_is_vacant?(104)).to be true
        end

        it 'opens a room (the tutorial way)' do
            hotel.check_in_guest('Joe Satriani', 205)
            hotel.check_out_guest('Joe Satriani', 205)
            expect(hotel.check_in_guest('Satch', 205)).to be true
        end
    end
end