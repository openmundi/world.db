#############################
### Build a new world.db


DB_ROOT="./db"

task :default => 'release'

task :release => [:setup] do
  puts "hello from release build script"
end

task :clean do
  ## todo: check if file exists ??
  puts "deleting world.db..."
  rm "world.db"
end

task :setup => :clean do
  puts "create new world.db..."
  sh "worlddb --create"
  
  ['de.countries',
   'at/cities',
   'be/cities',
   'by/cities',
   'ca/cities',
   'ch/cities',
   'cy/cities',
   'de/cities',
   'dk/cities',
   'en/cities',
   'es/cities',
   'fr/cities',
   'gr/cities',
   'hr/cities',
   'it/cities',
   'mx/cities',
   'nl/cities',
   'pt/cities',
   'ro/cities',
   'ru/cities',
   'sc/cities',
   'tr/cities',
   'ua/cities',
   'us/cities'
   ].each do |seed|
    sh "worlddb --include #{DB_ROOT} #{seed}"
  end
end
