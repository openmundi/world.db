# encoding: utf-8


br = Country.find_by_key!( 'br' )


regions_br = [
  ['s', 'South'],
  ['se', 'Southeast'],
  ['co', 'Centerweast'],
  ['ne', 'Northeast'],
  ['n', 'North']
]

states_br = [

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
  ['taubate',  'Taubate',  'region:se', 'state:sp'],
  ['sao paulo',    'Sao Paulo',    'region:se', 'state:sp'],
  ['sao jose dos campos',   'Sao Jose dos Campos',   'region:se', 'state:sp'],
  ['jacarei',  'Jacarei',  'region:se', 'state:sp'],
  ['ubatuba',   'Ubatuba',   'region:se', 'state:sp'],
  ['pindamonhangaba',  'Pindamonhangaba',  'region:se', 'state:sp'],
  ['caraguatatuba', 'Caraguatatuba', 'region:se', 'state:sp']
]

Region.create_from_ary!( regions_br, country: br )
State.create_from_ary!( state_br, country: br )
City.create_from_ary!( cities_br, country: br )