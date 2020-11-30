class Backer
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        ProjectBacker.all.collect do |pj|
            pj.project if pj.backer == self
        end.delete_if{|project| project == nil}
    end

end