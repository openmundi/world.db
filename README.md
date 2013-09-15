# Welcome to `world.db`

A free open public domain world database & schema
for use in any (programming) language
(e.g. uses plain text fixtures/data sets).


## Usage

Use the `worlddb` command line tool to build yourself a copy of
the `world.db` from the plain text fixtures in two steps.

Step 1:  Get a copy of the `world.db` fixtures

    $ git clone git://github.com/openmundi/world.db.git

Step 2:  Let's build the `world.db`

    $ worldb setup --include ./world.db

That's it. See the [`worlddb` command line tool project](https://github.com/geraldb/world.db.ruby)
for more.


![](https://raw.github.com/openmundi/world.db/master/i/sqlitestudio.png)


## Demo

Try the `world.db` Web Admin demo running
on Heroku [`worlddb.herokuapp.com`](http://worlddb.herokuapp.com).

## Tables, Schema

The `world.db` includes the following tables:

* countries
* regions
* cities
* tags
* taggings (many-to-many join table for tags+countries/regions/cities)
* langs
* usages (many-to-many join table for langs+countries)
* props

[add schema pic here]

###  `countries` Table

    CREATE TABLE "countries" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "title" varchar(255) NOT NULL,
      "key" varchar(255) NOT NULL,
      "tag" varchar(255) NOT NULL,
      "synonyms" varchar(255),
      "pop" integer,
      "area" integer,
      "created_at" datetime NOT NULL,
      "updated_at" datetime NOT NULL
    );

###  `regions` Table

    CREATE TABLE "regions" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "title" varchar(255) NOT NULL,
      "key" varchar(255) NOT NULL,
      "synonyms" varchar(255),
      "country_id" integer NOT NULL,
      "pop" integer, "area" integer,
      "created_at" datetime NOT NULL,
      "updated_at" datetime NOT NULL
    );

###  `cities` Table

    CREATE TABLE "cities" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "title" varchar(255) NOT NULL,
      "key" varchar(255) NOT NULL,
      "synonyms" varchar(255),
      "country_id" integer NOT NULL,
      "region_id" integer,
      "pop" integer,
      "area" integer,
      "created_at" datetime NOT NULL,
      "updated_at" datetime NOT NULL
    );



## Plain Text Fixtures

### Countries

[`north-america/countries.txt`](https://github.com/openmundi/world.db/blob/master/north-america/countries.txt):

```
ca, Canada,        CAN, 9_984_670,  34_278_406, un|north america
mx, Mexico,        MEX, 1_972_550, 112_322_757, un|north america
us, United States, USA, 9_629_091, 314_167_157, un|north america
```

### Cities

[`europe/at-austria/cities.txt`](https://github.com/openmundi/world.db/blob/master/europe/at/cities.txt):

```
Wien [Vienna],                W,  1_664_146
St. Pölten,                   N,     51_360
Wr. Neustadt|Wiener Neustadt, N,     39_940
```

The plain text format reader skips comments (starting with `#`)
and blank lines. Example:

```
###################################################
# Your comments here
#
```



## Real World Usage

[world.db.admin](https://github.com/geraldb/world.db.admin) - A free, open source web admin tool for world.db in Ruby on Rails (version 3.2 and up).

[sport.db](https://github.com/opensport) - free open public domain sports database & schema.

[football.db](https://github.com/openfootball) -  free open public domain football (soccer) database & schema

[formula1.db](https://github.com/opensport/formula1.db) - free open public domain Formula 1/Formula One database & schema

[ski.db](https://github.com/opensport/ski.db) -  free open public domain ski alpin/alpine ski database & schema

[beer.db](https://github.com/openbeer) - free open public domain beer database & schema

[Sportbook](https://github.com/openbookie/sportbook) - free, open source sports betting (prediction) pool
in Ruby on Rails (version 3.2 and up). 


## Alternatives

[geonames.org](http://geonames.org) - open geo (geographical) database covers all countries and contains over eight million placenames

[worlddb](http://code.google.com/p/worlddb) -  open world database alpha; includes country, region & city names in many languages names and latitude and longitude numbers and country's iso 2-letter code.

[countries](https://github.com/hexorx/countries) - world countries; includes data from ISO 3166 (countries and states/subdivisions ), ISO 4217 (currency), and E.164 (phone numbers).

[countries](https://github.com/mledoze/countries) - world countries with iso codes, currencies and more in JSON, CSV and XML.

[django-cities](https://github.com/coderholic/django-cities) - python script for importing countries, regions, cities etc. from geonames.org

[current-countries-of-earth](https://github.com/ewheeler/current-countries-of-earth) - python script to fetch current ISO 3166 country info; output as JSON



## Thank You - Contributors - ¡Gracias! - Obrigado - Danke

Ernesto Chapon - William de Melo Gueiros

## License

The `world.db` schema, data and scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Open Sports Database & Friends Forum/Mailing List](http://groups.google.com/group/opensport). Thanks!