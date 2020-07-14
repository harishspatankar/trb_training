module User::Operation
    class New < Trailblazer::Operation
        step Model( User, :new )
        step Contract::Build( constant: User::Contract::Create )
    end
end