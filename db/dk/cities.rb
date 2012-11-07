# encoding: utf-8

dk = Country.find_by_key!( 'dk' )

cities_dk = [
  ['farum','Farum']  ## region: North Zealand ??
]

City.create_from_ary!( cities_dk, country: dk )
