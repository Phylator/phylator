class Ahoy::Store < Ahoy::Stores::ActiveRecordTokenStore
    def exclude?
        bot?
    end
end
