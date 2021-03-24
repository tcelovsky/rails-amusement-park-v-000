class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        @user = User.find_by_id(self.user_id)
        @attraction = Attraction.find_by_id(self.attraction_id)
        # byebug
        if @user.tickets < @attraction.tickets && user.height < @attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.height < @attraction.min_height
            "Sorry. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.tickets < @attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        else
            @user.tickets -= @attraction.tickets
            @user.nausea += @attraction.nausea_rating
            @user.happiness += @attraction.happiness_rating
            @user.save
            # byebug
        end
    end

    private
    def current_user
        @user = User.find_by_id(:user_id)
    end

    def current_attraction
        @attraction = Attraction.find_by_id(:attraction_id)
    end

    def current_ride
        @ride = Ride.find_by(user_id:[:user_id])
    end
    
end
