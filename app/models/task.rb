class Task < ApplicationRecord

    before_save :capitalize_name

    after_create :log_task_creation

    before_destroy :prevent_destroy
    
    around_save :track_save_duration

    after_initialize :set_default_status

    after_commit :log_commit

    after_touch :log_touch

    private

    def capitalize_name
        self.name = name.capitalize
    end

    def log_task_creation
     puts "Task #{name} has been created"
    end

    def prevent_destroy
        if status == 'completed'
         errors.add(:base, 'cannot be deleted a completed tak')
         throw(:abort)
        end
    end

    def track_save_duration
        start_time = Time.now
        yield
    end_time = Time.now
    duration = end_time - start_time
    puts "Task  save took #{duration} secound"
    end

    def log_commit
        puts "Transction commited foe task #{name}"
    end

    def log_touch
       puts "Task #{name} was touched "
    end  

end
