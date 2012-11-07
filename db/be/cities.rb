# encoding: utf-8

be = Country.find_by_key!( 'be' )

cities_be = [
  ['brussel',   'Brüssel|Brussel|Bruxelles|Brussels']  # de|nl|fr|en   - RCA Anderlecht
]

City.create_from_ary!( cities_be, country: be )

