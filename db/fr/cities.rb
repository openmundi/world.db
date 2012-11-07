# encoding: utf-8

fr = Country.find_by_key!( 'fr' )

cities_fr = [
  ['lille',       'Lille'],
  ['paris',       'Paris'],
  ['marseille',   'Marseille'],
  ['montpellier', 'Montpellier']
]

City.create_from_ary!( cities_fr, country: fr )
