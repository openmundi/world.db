# encoding: utf-8

hr = Country.find_by_key!( 'hr' )

cities_hr = [
  ['zagreb','Zagreb']
]

City.create_from_ary!( cities_hr, country: hr )
