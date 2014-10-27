module HammerCLIForeman
  module SSH
    def self.version
      @version ||= Gem::Version.new '0.0.2'
    end
  end
end
