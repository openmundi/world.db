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
  ['taubate',  'Taubate', 'region:sp','se'],
  ['saopaulo',    'Sao Paulo', 'region:sp','se'],
  ['saojosedoscampos',   'Sao Jose dos Campos', 'region:sp','se'],
  ['jacarei',  'Jacarei', 'region:sp','se'],
  ['ubatuba',   'Ubatuba', 'region:sp','se'],
  ['pindamonhangaba',  'Pindamonhangaba', 'region:sp','se'],
  ['caraguatatuba', 'Caraguatatuba', 'region:sp','se']
]

Region.create_from_ary!( regions_br, country: br )
City.create_from_ary!( cities_br, country: br )