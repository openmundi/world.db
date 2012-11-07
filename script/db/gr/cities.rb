# encoding: utf-8

gr = Country.find_by_key!( 'gr' )

cities_gr = [
  ['piraeus','Piräus|Piraeus']
]

City.create_from_ary!( cities_gr, country: gr )
