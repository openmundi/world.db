# encoding: utf-8

## NB: for keys use internet domain/iso two letter code 
#
# more info about iso country codes:
#  -> http://en.wikipedia.org/wiki/ISO_3166-1
#  two letter codes   -> http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
#  three letter codes -> http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3
#
#  for three letter codes use fifa code or iso code
#  - fifa three letter country codes
#    -> http://en.wikipedia.org/wiki/List_of_FIFA_country_codes
#    -> differences (fifa,ioc,iso) -> http://en.wikipedia.org/wiki/Comparison_of_IOC,_FIFA,_and_ISO_3166_country_codes 


countries = [

  ####################
  ### europe 

  [ 'ad', 'Andorra',      'AND' ],
  [ 'al', 'Albanien',     'ALB' ],
  [ 'am', 'Armenien',     'ARM' ],
  [ 'at', 'Österreich',   'AUT' ],
  [ 'be', 'Belgien',      'BEL' ],
  [ 'bg', 'Bulgarien',    'BUL' ],  # NB: ISO (BGR) <> FIFA (BUL)
  [ 'by', 'Weißrussland', 'BLR' ],
  [ 'ch', 'Schweiz',      'SUI' ],  # NB: ISO (CHE) <> FIFA (SUI)
  [ 'cy', 'Zypern',       'CYP' ],
  [ 'cz', 'Tschechien',   'CZE' ],
  [ 'de', 'Deutschland',  'GER' ],  # NB: ISO (DEU) <> FIFA (GER)
  [ 'dk', 'Dänemark',     'DEN' ],  # NB: ISO (DNK) <> FIFA (DEN)
  [ 'en', 'England',      'ENG' ],  # NB: FIFA (ENG); not a valid iso country n internet domain / it's uk - what to use - anything better?
  [ 'es', 'Spanien',      'ESP' ],
  [ 'fi', 'Finnland',     'FIN' ],
  [ 'fo', 'Färöer',       'FRO' ],
  [ 'fr', 'Frankreich',   'FRA' ],
  [ 'ge', 'Georgien',     'GEO' ],
  [ 'gr', 'Griechenland', 'GRE' ],  # NB: ISO (GRC) <> FIFA (GRE)
  [ 'hr', 'Kroatien',     'CRO' ],  # NB: ISO (HRV) <> FIFA (CRO);  local name: Hrvatska
  [ 'hu', 'Ungarn',       'HUN' ],
  [ 'ie', 'Irland',       'IRL' ],
  [ 'it', 'Italien',      'ITA' ],
  [ 'kz', 'Kasachstan',   'KAZ' ],
  [ 'mt', 'Malta',        'MLT' ],
  [ 'nl', 'Niederlande',  'NED' ],  # NB: ISO (NLD) <> FIFA (NED)
  [ 'pl', 'Polen',        'POL' ],
  [ 'pt', 'Portugal',     'POR' ],  # NB: ISO (PRT) <> FIFA (POR)
  [ 'ro', 'Rumänien',     'ROU' ],
  [ 'rs', 'Serbien',      'SRB' ],
  [ 'ru', 'Russland',     'RUS' ],
  [ 'sc', 'Schottland',   'SCO' ],  # NB: FIFA (SCO); not a valid iso country/internet domain - it's uk - what to use - anything better?
  [ 'se', 'Schweden',     'SWE' ],
  [ 'si', 'Slowenien',    'SVN' ],
  [ 'sk', 'Slowakei',     'SVK' ],
  [ 'tr', 'Türkei',       'TUR' ],
  [ 'ua', 'Ukraine',      'UKR' ],

  ##############
  ## south america
  
  [ 'ar', 'Argentinien',   'ARG' ],
  [ 'br', 'Brasilien',     'BRA' ],
  [ 'cl', 'Chile',         'CHI' ],
  [ 'py', 'Paraguay',      'PAR' ],
  [ 'uy', 'Uruguay',       'URU' ],
  [ 'ec', 'Ecuador',       'ECU' ],
  [ 'co', 'Colombia',      'COL' ],

  #####################
  #### north/central america & caribbean islands
  
  [ 'ca', 'Kanada',        'CAN' ],
  [ 'mx', 'Mexiko',        'MEX' ],
  [ 'us', 'United States', 'USA' ],
  [ 'hn', 'Honduras',      'HON' ],
  [ 'cr', 'Costa Rica',    'CRC' ],
  [ 'sv', 'El Salvador',   'SLV' ],
  [ 'gy', 'Guyana',        'GUY' ],
  
  ########################
  ## africa
  
  [ 'dz', 'Algerien',       'ALG' ],
  [ 'ci', 'Elfenbeinküste', 'CIV' ],
  [ 'gh', 'Ghana',          'GHA' ],
  [ 'cm', 'Kamerun',        'CMR' ],
  [ 'ng', 'Nigeria',        'NGA' ],
  [ 'za', 'Südafrika',      'RSA' ],

  #############################
  ## asia w/ australia

  [ 'au', 'Australien', 'AUS' ],
  [ 'jp', 'Japan',      'JPN' ],
  [ 'kp', 'Nordkorea',  'PRK' ],
  [ 'kr', 'Südkorea',   'KOR' ],

  ###############################
  ## oceania
  
  [ 'nz', 'Neuseeland', 'NZL' ]
]


Country.create_from_ary!( countries )


Prop.create!( key: 'db.countries.version', value: '1' )