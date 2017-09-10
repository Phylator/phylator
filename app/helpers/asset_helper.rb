module AssetHelper

    # Get Asset as HTML String
    def asset path
        raw Uglifier.new(copyright: false).compile Rails.application.assets[path].to_s.html_safe
    end

end
