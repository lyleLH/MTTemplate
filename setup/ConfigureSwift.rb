module Pod

  class ConfigureSwift
    attr_reader :configurator
    
    def self.perform(options)
      new(options).perform
    
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      # keep_demo = configurator.ask_with_answers("Would you like to include a demo application with your library", ["Yes", "No"]).to_sym
      
      keep_demo = :yes
    
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        # :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :xcodeproj_path => "#{$current_dir}/templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => @configurator.prefix
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch #{$current_dir}/Pod/Classes/ReplaceMe.swift`

      `mv #{$current_dir}/templates/swift/* #{$current_dir}`

      # remove podspec for osx
      `rm #{$current_dir}/NAME-osx.podspec`
    end
  end

end
