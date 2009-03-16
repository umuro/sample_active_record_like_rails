namespace :cs do
namespace :db do
  desc "Fill the database with sample data. This requires memcached to be useful at all"
  task :populate => :environment do
    Parent.delete_all
    20.times { Factory(:offspring)}
    20.times { Factory(:parent)}
  end
end
end