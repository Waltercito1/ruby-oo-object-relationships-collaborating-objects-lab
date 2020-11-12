class MP3Importer
    attr_accessor :path #, :files

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |some_filename| some_filename.gsub("#{path}/", "") }
    end

    def import
        files.each{ |some_filename| Song.new_by_filename(some_filename) }
    end 
end