# encoding: utf-8

us = Country.find_by_key!( 'us' )

regions_us = [
  ['ca', 'California'],
  ['ny', 'New York'],
  ['ma', 'Massachusetts'],
  ['pa', 'Pennsylvania'],
  ['il', 'Illinois'],
  ['oh', 'Ohio'],
  ['mi', 'Michigan'],
  ['tn', 'Tennessee'],
  ['tx', 'Texas'],
  ['az', 'Arizona']
]

cities_us = [
  ['newyork',      'New York',     'region:ny'],
  ['buffalo',      'Buffalo',      'region:ny'],
  ['philadelphia', 'Philadelphia', 'region:pa'],
  ['boston',       'Boston',       'region:ma'],
  ['chicago',      'Chicago',      'region:il'],
  ['columbus',     'Columbus',     'region:oh'],
  ['detroit',      'Detroit',      'region:mi'],
  ['nashville',    'Nashville',    'region:tn'],
  ['dallas',       'Dallas',       'region:tx'],
  ['phoenix',      'Phoenix',      'region:az'],
  ['losangeles',   'Los Angeles',  'region:ca'],
  ['sanjose',      'San Jose',     'region:ca'],
  ['anaheim',      'Anaheim',      'region:ca'],
  ['stlouis',      'St. Louis'],
  ['pittsburgh',   'Pittsburgh'],
  ['washington',   'Washington']
]

Region.create_from_ary!( regions_us, country: us )
City.create_from_ary!( cities_us, country: us )
