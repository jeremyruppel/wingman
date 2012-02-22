module Wingman
  class StatusController < ActionController::Base

    respond_to :json, :only => :status

    def status

      render :json => { }
    end

    def index
    end
  end
end
