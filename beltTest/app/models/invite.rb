class Invite < ActiveRecord::Base
    belongs_to :user
    belongs_to :heval
end
