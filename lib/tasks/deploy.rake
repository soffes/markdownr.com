desc 'Prepare to deploy'
task :pack => :'js:minify' do
  `rm -rf public/stylesheets/*.css`
  `bundle exec compass compile`
  puts 'Packed.'
end

desc 'Deploy to Heroku'
task :deploy => :pack do
  unless `git status -s`.length == 0
    puts "WARNING: There are uncommitted changes"
    puts "Commit any changes before deploying."
    exit
  end
  
  `git push heroku master`
  `git push origin master`
end
