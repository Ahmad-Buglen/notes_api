class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(start_date, end_date)
    puts "SIdekiq Worker gen a report from #{start_date} to #{end_date}"
  end
end