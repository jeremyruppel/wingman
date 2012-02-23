module Wingman
  class StatusController < ActionController::Base

    respond_to :json, :only => :status

    def status

      render :json => {
        :current_time => Time.now.utc.to_s
      }
    end

    def index
    end
  end
end
