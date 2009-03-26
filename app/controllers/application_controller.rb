# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  ## Umur. If index and show are protected then cookie store overflows.
  protect_from_forgery :except => [:index,:show, :show_search, :update_table, :edit_associated, :list, :new_existing, :row, :nested, :edit_associated, :add_association]

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password
end
