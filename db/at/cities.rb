# encoding: utf-8

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
  ['wien',        'Wien|Vienna',      'region:wien'],

  ['stpoelten',   'St. Pölten', 'region:noe'],
  ['moedling',    'Mödling|Moedling', 'region:noe'],
  ['wrneustadt',  'Wiener Neustadt|Wr. Neustadt', 'region:noe'],
  ['horn',        'Horn',       'region:noe'],

  ['linz',        'Linz',        'region:ooe'],
  ['ried',        'Ried',        'region:ooe'],

  ['mattersburg', 'Mattersburg', 'region:bgld'],

  ['graz',        'Graz',        'region:stmk'],
  ['hartberg',    'Hartberg',    'region:stmk'],
  ['kapfenberg',  'Kapfenberg',  'region:stmk'],

  ['salzburg',    'Salzburg',    'region:sbg'],
  ['groedig',     'Grödig',      'region:sbg'],

  ['wolfsberg',   'Wolfsberg',   'region:ktn'],

  ['innsbruck',   'Innsbruck',   'region:tirol'],
  
  ['altach',      'Altach',     'region:vbg'],
  ['lustenau',    'Lustenau',   'region:vbg']
]

City.create_from_ary!( cities_at, country: at )


Prop.create!( key: 'db.at.cities.version', value: '1' )
