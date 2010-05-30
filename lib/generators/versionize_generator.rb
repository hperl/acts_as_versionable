class VersionizeGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Create a migration to add a version table for your model."
  
  argument :model_name, :required => true, :type => :string,
           :desc => "The model to versionize.", :banner => "ModelName"
  
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def model
    begin
      @model ||= @model_name.constantize
    rescue NameError
      raise Rails::Generators::Error.new("Could not find model '#{@model_name}'")
    end
  end
  
  def versions_table
    @model_name.downcase + '_versions'
  end

  def columns
    begin
      @columns ||= model.content_columns.reject { |c| c.type == :datetime }
    rescue Exception
      raise Rails::Generators::Error.new("Could not find table for '#{@model}' in your database. Do you have pending migrations?")
    end
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
