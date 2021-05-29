class HomeController < ApplicationController

  def index
  end

  def report
    ReportWorker.perform_async("09-09-2009", "10-10-2010")
    render text: "generate a report"
  end

  private 
  def generate_report 
    sleep(30)
  end
end
