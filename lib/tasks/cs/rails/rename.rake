#TODO rename fails if project folder already renamed. How to discover project name?

def file_replace_content(file,from,to)
  puts "Editing #{file}"
  File.open(file, 'r+') do |f|   
      out = ""
      f.each do |line|
          out << line.gsub(from) {to}
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

  desc "Rename project e.g. rake PROJECT=new_name rails:rename_project"
  task :rename_project do
    unless ENV['PROJECT']
      ENV['PROJECT'] = File.basename(Dir.pwd)
    else
      throw :project_already_exists if File.exist?(File.join('..', ENV['PROJECT']))
    end
    unless ENV['FROM_PROJECT']
      project = File.basename(Dir.pwd).underscore
    else
      project = ENV['FROM_PROJECT']
    end
    new_project = ENV['PROJECT'].underscore
    puts "Renaming project #{project} to #{new_project}"
    throw :project_expected unless new_project
        
    # New secret key and project name in environment.rb
    file_replace_content 'config/environment.rb', /#{project}/, new_project
    
    secret_key = `rake secret`.gsub(/\n/, '').gsub(/\(.*\)/,'')
    file_replace_content 'config/environment.rb', /:secret.*\=\>.*'.*'/, ":secret => '#{secret_key}'"

    # New sample_database.yml
    file_replace_content 'config/sample_database.yml', /#{project}/, new_project
    
    # New database.yml
    if File.exist? 'config/database.yml'
      file_replace_content 'config/database.yml', /#{project}/, new_project
    else
      FileUtils.cp 'config/sample_database.yml',  'config/database.yml'      
    end
    
    # For KDevelop
    if File.exist? project+'.kdevelop'
      file_replace_content project+'.kdevelop', /#{project}/, new_project
      File.rename project+'.kdevelop', new_project+'.kdevelop'
    end

    # Rename the project directory
    puts "Make sure project directory is #{new_project}"
  end

end
end