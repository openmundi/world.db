# encoding: utf-8

pt = Country.find_by_key!( 'pt' )

cities_pt = [
  ['porto', 'Porto'],
  ['braga', 'Braga'],
  ['lisboa', 'Lissabon|Lisboa']
]

City.create_from_ary!( cities_pt, country: pt )
