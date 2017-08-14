class StopwatchController < ApplicationController
   def index
      if current_user
        @projects = current_user.projects
      end
   end
end
