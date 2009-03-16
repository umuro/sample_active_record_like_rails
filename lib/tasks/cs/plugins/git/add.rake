namespace :cs do
namespace :plugins do
  namespace :git do
    desc "Add git submodules for plugins"
    task :add do
      puts `git submodule add git://github.com/umuro/cs_active_scaffold.git vendor/generators/cs_active_scaffold`
      puts `git submodule add git://github.com/timcharper/calendar_date_select.git vendor/plugins/calendar_date_select`
      puts `git submodule add -b rails-2.2 -- git://github.com/activescaffold/active_scaffold.git  vendor/plugins/active_scaffold`
      puts `git submodule add git://github.com/umuro/to_icon_rails.git vendor/plugins/to_icon_rails`
      puts `git submodule add git://github.com/umuro/active_record_base_without_table.git vendor/plugins/active_record_base_without_table`
      puts `git submodule add git://github.com/assaf/uuid.git vendor/plugins/uuid`
      puts `git submodule add git://github.com/umuro/active_record_like.git vendor/plugins/active_record_like`
    end
  end
end
end