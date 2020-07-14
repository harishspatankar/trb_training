class UsersController < ApplicationController
    
    def index
        run User::Operation::Index do |result|
            return render cell(User::Cell::Index, @model)
        end

        redirect_to welcome_index_path
    end

    def new
        run User::Operation::New do |result|
            return render cell(User::Cell::New, @form)
        end
    end

    def create
        run User::Operation::Create do |result|
            return redirect_to users_path
        end

        return render cell(User::Cell::New, @form)
    end
end
