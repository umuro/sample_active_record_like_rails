#TODO rename fails if project folder already renamed. How to discover project name?

def file_delete_marked(file)
  puts "Deleting marked sections of #{file}"
  File.open(file, 'r+') do |f|   
      out = ""
      deleting = false
      f.each do |line|
          if line =~ /#! DELETE BEGIN/
            deleting = true
          end
          
          out << line unless deleting
          
          if line =~ /#! DELETE END/
            deleting = false
          end
      end
      f.pos = 0                     
      f.print out
      f.truncate(f.pos)             
  end
end

#require 'ftools'
require 'fileutils'

namespace :cs do
namespace :rails do

  desc "Convert this into a fresh rails project"
  task :reset_clean => [ 'reset_project:delete_files', 'reset_project:clean_files', 'rename_project'] do
  end

  namespace :reset_project do
    task :clean_files do
      file_delete_marked('config/routes.rb')
    end
    
    task :delete_files do
      to_delete = Dir['app/**/*.rb']
      to_delete = to_delete.reject {|file| file =~ /info/ }
      to_delete = to_delete.reject {|file| file =~ /application/ }
      to_delete = to_delete + Dir['app/views/people/*']
      to_delete = to_delete + Dir['app/views/people']
      to_delete = to_delete + Dir['app/views/addresses/*']
      to_delete = to_delete + Dir['app/views/addresses']
      to_delete = to_delete + Dir['test/fixtures']
      to_delete = to_delete + Dir['test/functional']
      to_delete = to_delete + Dir['test/unit']
      to_delete = to_delete + Dir['app/views/addresses']
      to_delete = to_delete + Dir['db/migrate/*']
      to_delete = to_delete + Dir['lib/tasks/populate*.rake']
      to_delete = to_delete + Dir['tmp/*/**']
      to_delete = to_delete + Dir['*.kdevses']
      to_delete = to_delete + Dir['log/**/*.log']  
      to_delete = to_delete + Dir['config/database.yml']
      to_delete.each do |file|
        if File.directory? file 
          Dir.delete file
        else
          File.delete file
        end
      end
    end
  end
end
end