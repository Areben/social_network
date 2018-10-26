class User < ActiveRecord::Base
    has_secure_password

    has_many :invites
    
    has_many :hevals,
        through: :invites,
        source: :heval

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :name, presence: true,
        length: { in: 2..20 }
    validates :password, presence: true,
        length: { in: 8..20 }
    validates :email, presence: true,
        uniqueness: { case_sensitive: false },
        format: { with: EMAIL_REGEX }

    before_save :downcase_email

    after_create :successfully_created

    after_update :successfully_updated

    private
        def downcase_email
            self.email.downcase!
        end

        def successfully_created
            puts "Successfully created a new user"
        end

        def successfully_updated
            puts "Successfully updated a existing user"
        end
end
