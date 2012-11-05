# encoding: utf-8

de = Country.find_by_key!( 'de' )

regions_de = [
  ['bw', 'Baden-Württemberg'],
  ['by', 'Bayern'],
  ['be', 'Berlin'],
  ['bb', 'Brandenburg'],
  ['hb', 'Bremen'],
  ['hh', 'Hamburg'],
  ['he', 'Hessen'],
  ['mv', 'Mecklenburg-Vorpommern'],
  ['ni', 'Niedersachsen'],
  ['nw', 'Nordrhein-Westfalen'],
  ['rp', 'Rheinland-Pfalz'],
  ['sl', 'Saarland'],
  ['sn', 'Sachsen'],
  ['st', 'Sachsen-Anhalt'],
  ['sh', 'Schleswig-Holstein'],
  ['th', 'Thüringen']
]

Region.create_from_ary!( regions_de, country: de )


cities_de = [
  ['muenchen',      'München',       'region:by'],
  ['nuernberg',     'Nürnberg',      'region:by'],
  ['augsburg',      'Augsburg',      'region:by'],
  ['fuerth',        'Fürth',         'region:by'],
  ['stuttgart',     'Stuttgart',     'region:bw'],
  ['hoffenheim',    'Hoffenheim',    'region:bw'],
  ['freiburg',      'Freiburg',      'region:bw'],
  ['hannover',      'Hannover',      'region:ni'],
  ['wolfsburg',     'Wolfsburg',     'region:ni'],
  ['gelsenkirchen', 'Gelsenkirchen', 'region:nw'],
  ['dortmund',      'Dortmund',      'region:nw'],
  ['leverkusen',    'Leverkusen',    'region:nw'],
  ['duesseldorf',   'Düsseldorf',    'region:nw'],
  ['mgladbach',     "Mönchengladbach|M'gladbach", 'region:nw' ],
  ['frankfurt',     'Frankfurt',     'region:he'],
  ['mainz',         'Mainz',         'region:rp'],
  ['hamburg',       'Hamburg',       'region:hh'],
  ['bremen',        'Bremen',        'region:hb']
]

City.create_from_ary!( cities_de, country: de )


Prop.create!( key: 'db.de.cities.version', value: '1' )
