# encoding: utf-8


cities_sc = [
  ['glasgow','Glasgow']
]

sc = Country.find_by_key!( 'sc' )
City.create_from_ary!( cities_sc, country: sc )


cities_tr = [
  ['istanbul','Istanbul']
]

tr = Country.find_by_key!( 'tr' )
City.create_from_ary!( cities_tr, country: tr )


cities_ro = [
  ['cluj','Cluj']
]

ro = Country.find_by_key!( 'ro' )
City.create_from_ary!( cities_ro, country: ro )
 
 
cities_ch = [
  ['basel','Basel']
]

ch = Country.find_by_key!( 'ch' )
City.create_from_ary!( cities_ch, country: ch )


cities_cy = [
  ['nikosia','Nikosia|Nicosia']
]

cy = Country.find_by_key!( 'cy' )
City.create_from_ary!( cities_cy, country: cy )



cities_mx = [
  ['mexico',        'México' ],
  ['cancun',        'Cancún' ],
  ['guadalajara',   'Guadalajara' ],
  ['tuxtla',        'Tuxtla Gutiérrez' ],
  ['leon',          'León' ],
  ['morelia',       'Morelia' ],
  ['monterrey',     'Monterrey' ],
  ['pachuca',       'Pachuca' ],
  ['puebla',        'Puebla' ],
  ['queretaro',     'Querétaro' ],
  ['sanluispotosi', 'San Luis Potosì' ],
  ['torreon',       'Torreón' ],
  ['tijuana',       'Tijuana' ],
  ['toluca',        'Toluca' ],
  ['sannicolas',    'San Nicolás de los Garza' ]
]

mx = Country.find_by_key!( 'mx' )
City.create_from_ary!( cities_mx, country: mx )


regions_ca = [
  ['on', 'Ontario'],
  ['qc', 'Quebec'],
  ['ns', 'Nova Scotia'],
  ['nb', 'New Brunswick'],
  ['mb', 'Manitoba'],
  ['bc', 'British Columbia'],
  ['pe', 'Prince Edward Island'],
  ['sk', 'Saskatchewan'],
  ['ab', 'Alberta'],
  ['nl', 'Newfoundland and Labrador']
]

cities_ca = [
  ['montreal',  'Montreal',  'region:qc'],
  ['ottawa',    'Ottawa',    'region:on'],
  ['toronto',   'Toronto',   'region:on'],
  ['winnipeg',  'Winnipeg',  'region:mb'],
  ['calgary',   'Calgary',   'region:ab'],
  ['edmonton',  'Edmonton',  'region:ab'],
  ['vancouver', 'Vancouver', 'region:bc']
]

ca = Country.find_by_key!( 'ca' )
Region.create_from_ary!( regions_ca, country: ca )
City.create_from_ary!( cities_ca, country: ca )


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

us = Country.find_by_key!( 'us' )
Region.create_from_ary!( regions_us, country: us )
City.create_from_ary!( cities_us, country: us )


Prop.create!( key: 'db.cities.version', value: '1' )