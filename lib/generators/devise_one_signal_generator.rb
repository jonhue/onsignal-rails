require 'rails/generators'
require 'rails/generators/migration'

class DeviseOneSignalGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install devise-onesignal'

    def self.next_migration_number dirname
        if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime '%Y%m%d%H%M%S'
        else
            "%.3d" % (current_migration_number(dirname) + 1)
        end
    end

    def create_migration_file
        migration_template 'migration.rb.erb', 'db/migrate/devise_one_signal_migration.rb', migration_version: migration_version
    end

    def create_initializer
        template 'initializer.rb', 'config/initializers/devise-onesignal.rb'
    end

    def show_readme
        readme 'README.md'
    end

    private

    def migration_version
        if Rails.version >= '5.0.0'
            "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
    end

end
