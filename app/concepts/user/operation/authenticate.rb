module User::Operation
    class Authenticate < Trailblazer::Operation
        step Model( User, :find_by, :email )
        fail :email_not_found, fail_fast: true
        step Contract::Build( constant: User::Contract::Session )
        step Contract::Validate()
        fail :invalid_information
        step :validate_user
        fail :user_not_found, fail_fast: true
        step :generate_token

        def invalid_information(ctx, **)
            ctx[:error] = ctx['contract.default'].errors.message
        end

        def email_not_found(ctx, **)
            ctx[:error] = 'Unable to find user with email address'
        end

        def validate_user(ctx, model:, params:,  **)
            model[:password] == params[:password]
        end

        def user_not_found(ctx, **)
            ctx[:error] = 'Invalid credentials'
        end

        def generate_token(ctx, model:, **)
            ctx[:token] = SecureRandom.uuid
        end
    end
end