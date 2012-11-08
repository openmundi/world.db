# encoding: utf-8

#########
# sources:
#  http://en.wikipedia.org/wiki/List_of_cities_and_towns_in_Austria
#  http://en.wikipedia.org/wiki/List_of_cities_in_Austria_over_5,000_population_(2001_census)


at = Country.find_by_key!( 'at' )


## 9 Bundeslaender

regions_at = [
  ['wien',  'Wien'], # Wien
  ['noe',   'NÖ'],      # Niederösterreich
  ['ooe',   'OÖ'],      # Oberösterreich
  ['bgld',  'Bgld.'],   # Burgenland
  ['stmk',  'Stmk.'],   # Steiermark
  ['sbg',   'Sbg.'],    # Salzburg
  ['ktn',   'Ktn.'],    # Kärnten
  ['tirol', 'Tirol'],   # Tirol 
  ['vbg',   'Vbg.']     # Vorarlberg
]

Region.create_from_ary!( regions_at, country: at )

Prop.create!( key: 'db.at.regions.version', value: '1' )