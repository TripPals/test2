class ApplicationController < ActionController::Base
    include Pundit
    # PostPolicy.new(current_user, @post).update?

end
