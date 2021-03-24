class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if nausea > happiness
            return "sad"
        else return "happy"
        end
    end

    private 
    def current_user
        @user = User.find_by_id(:id)
    end
end
