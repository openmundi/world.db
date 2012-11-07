# encoding: utf-8

ru = Country.find_by_key!( 'ru' )

cities_ru = [
  ['moskva',      'Moskau|Moskva'],
  ['stpetersburg','St. Petersburg']
]

City.create_from_ary!( cities_ru, country: ru )

