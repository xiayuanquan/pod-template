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
      
      #默认值
      prefix = "XYQ"

      #调用ProjectManipulator类的方法，使用hash参数初始化
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :prefix => prefix
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Sources/Classes/ReplaceMe.swift`

      `mv ./templates/swift/Example/* ./`

    end
  end

end
