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
  
  ['africa/countries',
   'america/countries',
   'america/ca/cities',
   'america/mx/cities',
   'america/us/cities',
   'america/ve/cities',
   'asia/countries',
   'asia/jp/cities',
   'europe/countries',
   'europe/at/cities',
   'europe/be/cities',
   'europe/by/cities',
   'europe/ch/cities',
   'europe/cy/cities',
   'europe/de/cities',
   'europe/dk/cities',
   'europe/en/cities',
   'europe/es/cities',
   'europe/fr/cities',
   'europe/gr/cities',
   'europe/hr/cities',
   'europe/it/cities',
   'europe/nl/cities',
   'europe/pt/cities',
   'europe/ro/cities',
   'europe/ru/cities',
   'europe/sc/cities',
   'europe/tr/cities',
   'europe/ua/cities',
   'oceania/countries',
   'oceania/au/cities'
   ].each do |seed|
    sh "worlddb --include #{DB_ROOT} #{seed}"
  end
end
