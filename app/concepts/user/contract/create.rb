module User::Contract
    class Create < Reform::Form
        property :name
        property :email

        validates :name, :email, presence: true
        validates_uniqueness_of :email
        validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    end
end