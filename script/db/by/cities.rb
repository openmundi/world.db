# encoding: utf-8

by = Country.find_by_key!( 'by' )

cities_by = [
  ['borisov','Borissow|Borisov|Barysaw']
]

City.create_from_ary!( cities_by, country: by )
