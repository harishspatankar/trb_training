module User::Operation
    class Index < Trailblazer::Operation
        
        step :valid_user?
        step :get_users

        def valid_user?(ctx, **)
            true
        end

        def get_users(ctx, **)
            ctx[:model] = User.all
        end

    end
end