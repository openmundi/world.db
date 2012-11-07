# encoding: utf-8

tr = Country.find_by_key!( 'tr' )

cities_tr = [
  ['istanbul','Istanbul']
]

City.create_from_ary!( cities_tr, country: tr )
