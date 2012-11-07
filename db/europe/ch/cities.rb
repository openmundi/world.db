# encoding: utf-8

ch = Country.find_by_key!( 'ch' )

cities_ch = [
  ['basel','Basel']
]

City.create_from_ary!( cities_ch, country: ch )
