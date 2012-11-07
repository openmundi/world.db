# encoding: utf-8

nl = Country.find_by_key!( 'nl' )

cities_nl = [
  ['amsterdam','Amsterdam'],
  ['alkmaar','Alkmaar']  ## region: North Holland
]

City.create_from_ary!( cities_nl, country: nl )

