# encoding: utf-8


br = Country.find_by_key!( 'br' )

regions_br = [

  ['ac', 'Acre'],
  ['al', 'Alagoas'],
  ['am', 'Amapa'],
  ['ap', 'Amazonas'],
  ['ba', 'Bahia'],
  ['ce', 'Ceara'],
  ['df', 'Distrito Federal'],
  ['es', 'Espirito Santo'],
  ['go', 'Goias'],
  ['to', 'Tocantins'],
  ['ma', 'Maranhao'],
  ['mg', 'Minas Gerais'],
  ['ms', 'Mato Grosso do Sul'],
  ['mt', 'Mato Grosso'],
  ['pa', 'Para'],
  ['pb', 'Paraiba'],
  ['pe', 'Pernambuco'],
  ['pi', 'Piaui'],
  ['pr', 'Parana'],
  ['rj', 'Rio de Janeiro'],
  ['rn', 'Rio Grande do Norte'],
  ['ro', 'Rondonia'],
  ['rr', 'Roraima'],
  ['rs', 'Rio Grande do Sul'],
  ['sc', 'Santa Catarina'],
  ['se', 'Sergipe'],
  ['sp', 'Sao Paulo']
]

cities_br = [
  ['taubate',  'Taubate', 'state:sp','se'],
  ['saopaulo',    'Sao Paulo', 'state:sp','se'],
  ['saojosedoscampos',   'Sao Jose dos Campos', 'state:sp','se'],
  ['jacarei',  'Jacarei', 'state:sp','se'],
  ['ubatuba',   'Ubatuba', 'state:sp','se'],
  ['pindamonhangaba',  'Pindamonhangaba', 'state:sp','se'],
  ['caraguatatuba', 'Caraguatatuba', 'state:sp','se']
]

Region.create_from_ary!( regions_br, country: br )
City.create_from_ary!( cities_br, country: br )