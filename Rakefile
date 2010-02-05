namespace :compass do
  desc "Start Compass watching the SASS directory"
  task :watch do
    system "compass -w -c config/compass.rb"
  end
end

desc "Start local server"
task :server do
  system "shotgun config.ru"
end
