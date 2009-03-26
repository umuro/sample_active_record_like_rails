if RAILS_ENV == 'development'
  Rails.configuration.after_initialize do
      Parent.delete_all
      5.times { Factory(:parent)}
      3.times { Factory(:property)}
  end
end