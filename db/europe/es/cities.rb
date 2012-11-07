# encoding: utf-8

es = Country.find_by_key!( 'es' )

cities_es = [
  ['bilbao',    'Bilbao'],
  ['valencia',  'Valencia'],
  ['barcelona', 'Barcelona'],
  ['madrid',    'Madrid'],
  ['malaga',    'Málaga']
]

City.create_from_ary!( cities_es, country: es )
