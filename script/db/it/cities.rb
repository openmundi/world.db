# encoding: utf-8

it = Country.find_by_key!( 'it' )

cities_it = [
  ['turin',   'Turin'],
  ['milano',  'Mailand|Milano'],
  ['napoli',  'Neapel|Napoli']
]

City.create_from_ary!( cities_it, country: it )
