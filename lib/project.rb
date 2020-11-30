class Project
    attr_accessor :title
    @@all = []

    def initialize(title)
        @title = title
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        ProjectBacker.all.collect do |pj|
            pj.backer if pj.project == self
        end.delete_if{|backer| backer == nil}
    end
    
end