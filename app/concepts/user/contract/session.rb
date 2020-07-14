module User::Contract
    class Session < Reform::Form
        property :email
        property :password

        validates :email, :password, presence: true
        validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    end
end