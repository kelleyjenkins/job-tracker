class DashboardController < ApplicationController

  def index
    @company = Company.all
    @jobs = Job.all
  end

end
