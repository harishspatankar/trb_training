class WelcomeController < ApplicationController
    def index
        return render cell(Welcome::Cell::Index)
    end
end
