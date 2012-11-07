# encoding: utf-8

###################################################
## north/central/south america & caribbean islands


countries = [

  #####################
  #### north america
  
  [ 'ca', 'Canada',        'CAN' ],
  [ 'mx', 'Mexico',        'MEX' ],
  [ 'us', 'United States', 'USA' ],

  #####################
  ## central america & caribbean islands

  [ 'cr', 'Costa Rica',    'CRC' ],
  [ 'gy', 'Guyana',        'GUY' ],
  [ 'hn', 'Honduras',      'HON' ],
  [ 'sv', 'El Salvador',   'SLV' ],
  
  ##############
  ## south america
  
  [ 'ar', 'Argentina',     'ARG' ],
  [ 'br', 'Brazil',        'BRA' ],
  [ 'cl', 'Chile',         'CHI' ],
  [ 'co', 'Colombia',      'COL' ],
  [ 'ec', 'Ecuador',       'ECU' ],
  [ 'py', 'Paraguay',      'PAR' ],
  [ 'uy', 'Uruguay',       'URU' ],
  [ 've', 'Venezuela',     'VEN' ]
]

Country.create_from_ary!( countries )

Prop.create!( key: 'db.countries.america.version', value: '1' )
