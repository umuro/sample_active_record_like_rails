if RAILS_ENV == 'development'
  Rails.configuration.after_initialize do
      Parent.delete_all
      10.times { Factory(:offspring)}
      5.times { Factory(:parent)}
  end
end