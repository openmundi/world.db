# encoding: utf-8

###############################
## australia & oceania

countries = [
  [ 'au', 'Australia', 'AUS' ],
  [ 'nz', 'New Zealand', 'NZL' ]
]

Country.create_from_ary!( countries )


Prop.create!( key: 'db.countries.oceania.version', value: '1' )
