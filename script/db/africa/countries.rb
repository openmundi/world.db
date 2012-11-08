# encoding: utf-8

##################################
## africa
##

countries = [
  [ 'dz', 'Algeria',        'ALG' ],
  [ 'ci', "Côte d'Ivoire",  'CIV' ],
  [ 'gh', 'Ghana',          'GHA' ],
  [ 'cm', 'Cameroon',       'CMR' ],
  [ 'ng', 'Nigeria',        'NGA' ],
  [ 'za', 'South Africa',   'RSA' ]
]

Country.create_from_ary!( countries )


Prop.create!( key: 'db.countries.africa.version', value: '1' )
