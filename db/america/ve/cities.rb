ve = Country.find_by_key!( 've' )

cities_ve = [
  ['barcelona',          'Barcelona' ],
  ['barinas',            'Barinas' ],
  ['barquisimeto',       'Barquisimeto' ],
  ['caracas',            'Caracas' ],
  ['ciudadbolivar',      'Ciudad Bolívar' ],
  ['coro',               'Coro' ],
  ['cumana',             'Cumańa' ],
  ['guanare',            'Guanare' ],
  ['laasuncion',         'La Asunción' ],
  ['laguaira',           'La Guaira' ],
  ['merida',             'Mérida' ],
  ['maracaibo',          'Maracaibo' ]
  ['maracay',            'Maracay' ],
  ['maturin',            'Maturín' ],
  ['puertoayacucho',     'Puerto Ayacucho' ],
  ['sancarlos',          'San Carlos' ],
  ['sancristobal',       'San Cristobal' ],
  ['sanfelipe',          'San Felipe' ],
  ['sanfernandodeapure', 'San Fernando de Apure' ],
  ['sanjuandelosmorros', 'San Juan de los Morros' ],
  ['trujillo',           'Trujillo' ],
  ['tucupita',           'Tucupita' ],
  ['valencia',           'Valencia' ],
]

City.create_from_ary!( cities_ve, country: ve )