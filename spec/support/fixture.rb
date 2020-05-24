# frozen_string_literal: true

# Monkey patch
class Fixture

  class << self

  private

    def read_file(type, fixture)
      path = File.expand_path "spec/fixtures/#{type}/#{fixture}.#{TYPES[type]}", $GEM_DIR
      unless File.exist? path
        path = File.expand_path "../../fixtures/#{type}/#{fixture}.#{TYPES[type]}", __FILE__
      end
      raise ArgumentError, "Unable to load: #{path}" unless File.exist? path

      File.read path
    end

  end
end
