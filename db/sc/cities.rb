# encoding: utf-8

sc = Country.find_by_key!( 'sc' )

cities_sc = [
  ['glasgow','Glasgow']
]

City.create_from_ary!( cities_sc, country: sc )

