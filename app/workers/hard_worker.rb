class HardWorker
  include Sidekiq::Worker

  def perform(start_date, end_date)
    puts "Sidekiq worker generating a roport from #{start_date} to #{end_date}"
  end
end
