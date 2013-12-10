# Places


## MusicBrainz

- Musicbrainz table places [(doc)](https://musicbrainz.org/doc/Place)
- MusicBrainz table area  [(doc](https://musicbrainz.org/doc/Area)
    - types include: country, subdivision, city, municipality, district

### Examples

Place: [Royal Albert Hall](http://musicbrainz.org/place/4352063b-a833-421b-a420-e7fb295dece0)

Area: [Kensington and Chelsea](http://musicbrainz.org/area/b9576171-3434-4d1b-8883-165ed6e65d2f)

### Notes n Links

- [MusicBrainz Database](http://musicbrainz.org/doc/MusicBrainz_Database)
- [MusicBrainz Database Schema](http://musicbrainz.org/doc/MusicBrainz_Database/Schema)


MusicBrainz links with Wikidata [(doc)](https://musicbrainz.org/doc/Wikidata)

### License

The MisicBrainz core data is licensed under the CC0,
which is effectively placing the data into the Public Domain.
This means that anyone can download and use the core data in any way they see fit.
No restrictions, no worries!



## Y! GeoPlanet

- [Project Site](http://developer.yahoo.com/geo/geoplanet)
- [Developer Guide](http://developer.yahoo.com/geo/geoplanet/guide)


### Place table

- places: returns information about a place or places.

#### Place types

- Continent    - One of the major land masses on the earth.
    GeoPlanet is built on a seven-continent model:
    Asia (24865671), Africa (24865670), North America (24865672), South America (24865673),
    Antarctica (28289421), Europe (24865675),
    and Pacific (Australia, New Zealand, and the other islands in the Pacific Ocean -- 24865674).

- Country      - One of the countries and dependent territories defined by the ISO 3166-1 standard.

- Admin     - One of the primary administrative areas within a country.
    Place type names associated with this place type include: State, Province, Prefecture, Country, Region, Federal District.

- Admin2   - One of the secondary administrative areas within a country.
     Place type names associated with this place type include: County, Province, Parish, Department, District.
     
- Admin3   -  One of the tertiary administrative areas within a country.
      Place type names associated with this place type include: Commune, Municipality, District, Ward.
      
- Town  - One of the major populated places within a country.
     This category includes incorporated cities and towns, major unincorporated towns and villages.
     
- Suburb - One of the subdivisions within a town.
     This category includes suburbs, neighborhoods, wards.
     
- Postal Code - One of the postal code areas within a country.
     This category includes both full postal codes (such as those in UK and CA) and partial postal codes.
     Examples include: SW1A 0AA (UK), 90210 (US), 179-0074 (JP).
     
- Supername   - A place that refers to a region consisting of multiple countries or an historical country that has been dissolved into current countries.
     Examples include Scandinavia, Latin America, USSR, Yugoslavia, Western Europe, and Central America.

- Colloquial  - Examples are New England, French Riviera, 関西地方(Kansai Region), South East England, Pacific States, and Chubu Region.

- Time Zone - A place that refers to an area defined by the Olson standard.
     Examples include America/Los Angeles, Asia/Tokyo, Europe/Madrid.



### More tables

- continents: Returns information about places that are continents.
- oceans: Returns information about places that are oceans.
- seas: Returns information about places that are seas, bays, or channels.
- countries: Returns information about places that are countries or dependent territories.
- states: Returns information about places that are first-level administrative areas within a country.
- counties: Returns information about places that are second-level administrative areas within a country.
- districts: Returns information about places that are third-level administrative areas within a country.

