# encoding: utf-8

###################################################
## north/central/south america & caribbean islands


countries = [

  #####################
  #### north america
  
                                  # area (in sq km), pop(ulation)
  
  [ 'ca', 'Canada',        'CAN', 9984670,  34278406, 'motor:CDN', 'tags:north america|en|fr' ],
  [ 'mx', 'Mexico',        'MEX', 1972550, 112322757, 'motor:MEX', 'tags:north america|en' ],
  [ 'us', 'United States', 'USA', 9629091, 314167157, 'motor:USA', 'tags:north america|es' ],

  #####################
  ## central america & caribbean islands

  [ 'cr', 'Costa Rica',    'CRC' ],
  [ 'hn', 'Honduras',      'HON' ],
  [ 'sv', 'El Salvador',   'SLV' ],
  
  ##############
  ## south america
  
  [ 'ar', 'Argentina',     'ARG', 2780400,  40518425, 'motor:RA',  'tags:south america|es' ],
  [ 'bo', 'Bolivia',       'BOL', 1098581,  10907778, 'motor:BOL', 'tags:south america|es' ],
  [ 'br', 'Brazil',        'BRA', 8514215, 192380000, 'motor:BR',  'tags:south america|pt' ],
  [ 'cl', 'Chile',         'CHI',  755696,  16763470, 'motor:RCH', 'tags:south america|es' ],
  [ 'co', 'Colombia',      'COL', 1138748,  46413791, 'motor:CO',  'tags:south america|es' ],
  [ 'ec', 'Ecuador',       'ECU',  258238,  15007343, 'motor:EC',  'tags:south america|es' ],
  [ 'gy', 'Guyana',        'GUY',  214970,    752940, 'motor:GUY', 'tags:south america|en' ],
  [ 'pe', 'Peru',          'PER', 1285220,  29546963, 'motor:PE',  'tags:south america|es' ],
  [ 'sr', 'Suriname',      'SUR',  163820,    492829, 'motor:SME', 'tags:south america|nl'],
  [ 'py', 'Paraguay',      'PAR',  406752,   6375830, 'motor:PY',  'tags:south america|es' ],
  [ 'uy', 'Uruguay',       'URU',  176215,   3510386, 'motor:ROU', 'tags:south america|es' ],
  [ 've', 'Venezuela',     'VEN',  916445,  28833845, 'motor:YV',  'tags:south america|es' ]
]

Country.create_from_ary!( countries )

Prop.create!( key: 'db.countries.america.version', value: '1' )
