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

Prop.create!( key: 'db.de.regions.version', value: '1' )
