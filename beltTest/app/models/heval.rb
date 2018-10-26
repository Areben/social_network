class Heval < ActiveRecord::Base
    belongs_to :user
    
    has_many :invites
    has_many :users,
        through: :invites
end
