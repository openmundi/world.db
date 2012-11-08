# encoding: utf-8


ca = Country.find_by_key!( 'ca' )


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

Region.create_from_ary!( regions_ca, country: ca )
City.create_from_ary!( cities_ca, country: ca )
