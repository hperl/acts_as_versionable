class VersionizeGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Create a migration to add a version table for your model."
  
  argument :model_name, :required => true, :type => :string,
           :desc => "The model do versionize.", :banner => "ModelName"
  
   def self.source_root
     @source_root ||= File.expand_path('../templates', __FILE__)
   end
  
  def generate_migration
    migration_template "migration.rb.erb", "db/migrate/#{migration_name}.rb"
  end
  
  protected
  def migration_name
    "create_versions_for_#{model_name.underscore.pluralize}"
  end
  
  def self.next_migration_number(dirname) #:nodoc:
    Time.now.strftime("%Y%m%d%H%M%S")
  end
end
