# encoding: utf-8

ro = Country.find_by_key!( 'ro' )

cities_ro = [
  ['cluj','Cluj']
]

City.create_from_ary!( cities_ro, country: ro )
