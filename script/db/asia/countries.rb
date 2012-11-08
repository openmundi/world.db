# encoding: utf-8

##################################
### asia (includes middle east)
##

## NB: uefa country kazakhstan is listed here 
## NB: australia is listed in oceania (w/ australia)


countries = [
  [ 'jp', 'Japan',      'JPN' ],
  [ 'kp', 'North Korea',  'PRK' ],
  [ 'kr', 'South Korea',   'KOR' ],
  [ 'in', 'India',         'IND' ],
  [ 'kz', 'Kazakhstan',   'KAZ', 'tags:uefa' ]
]


Country.create_from_ary!( countries )

Prop.create!( key: 'db.countries.asia.version', value: '1' )
