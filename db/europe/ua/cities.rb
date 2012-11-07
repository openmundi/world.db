# encoding: utf-8

ua = Country.find_by_key!( 'ua' )

cities_ua = [
  ['kiev',     'Kiew|Kiev|Kyiv' ],
  ['donetsk',  'Donezk|Donetsk'],
  ['kharkov',  'Kharkiv|Kharkov']
]

City.create_from_ary!( cities_ua, country: ua )
