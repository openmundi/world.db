# encoding: utf-8


cy = Country.find_by_key!( 'cy' )

cities_cy = [
  ['nikosia','Nikosia|Nicosia']
]

City.create_from_ary!( cities_cy, country: cy )

