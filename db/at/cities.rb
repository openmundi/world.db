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

cities_at = [
  ['wien',        'Wien|Vienna',      'region:wien',  1664146],

  ['stpoelten',   'St. Pölten',                   'region:noe', 51360],
  ['wrneustadt',  'Wiener Neustadt|Wr. Neustadt', 'region:noe', 39940],
  ['moedling',    'Mödling|Moedling',             'region:noe', 20649],
  ['horn',        'Horn',                         'region:noe',  6411],  # < 10000 pop

  ['linz',        'Linz',             'region:ooe',   188894],
  ['wels',        'Wels',             'region:ooe',    58623],
  ['steyr',       'Steyr',            'region:ooe',    38979],
  ['ried',        'Ried im Innkreis', 'region:ooe',    11585],

  ['eisenstadt',  'Eisenstadt',  'region:bgld', 12367],
  ['mattersburg', 'Mattersburg', 'region:bgld',  6256],  # < 10000 pop

  ['graz',        'Graz',        'region:stmk',  247698],
  ['kapfenberg',  'Kapfenberg',  'region:stmk',   21928],
  ['hartberg',    'Hartberg',    'region:stmk',    6547],   # < 10000 pop

  ['salzburg',    'Salzburg',    'region:sbg',   149018],
  ['groedig',     'Grödig',      'region:sbg',     6638],   # < 10000 pop

  ['klagenfurt',  'Klagenfurt',  'region:ktn',  92397],
  ['villach',     'Villach',     'region:ktn',  58480],
  ['wolfsberg',   'Wolfsberg',   'region:ktn',  25361],

  ['innsbruck',   'Innsbruck',   'region:tirol',  117693],
  
  ['dornbirn',    'Dornbirn',   'region:vbg', 44243],
  ['feldkirch',   'Feldkirch',  'region:vbg', 30093],
  ['bregenz',     'Bregenz',    'region:vbg', 27148],
  ['lustenau',    'Lustenau',   'region:vbg', 20606],
  ['altach',      'Altach',     'region:vbg',  5704],   # < 10000 pop
]

City.create_from_ary!( cities_at, country: at )


Prop.create!( key: 'db.at.cities.version', value: '1' )
