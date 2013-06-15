# Welcome to `world.db`

A free open public domain world database & schema
for use in any (programming) language
(e.g. uses plain text fixtures/data sets)


## Usage

Build yourself a copy of the `world.db` from the plain text fixtures
in two steps.

Step 1:  Get a copy of the `world.db` fixtures

    $ git clone git://github.com/geraldb/world.db.git

Step 2:  Let's build the `world.db`

    $ worldb setup --include ./world.db

That's it.

![](https://raw.github.com/geraldb/world.db/master/i/sqlitestudio.png)


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


## Command Line Tool

To build your own `world.db` copy
use the `worlddb` command line tool.
See the [`worlddb` command line tool project](https://github.com/geraldb/world.db.ruby)
for more.


## Plain Text Fixtures

The `worlddb` command line tool lets you import fixtures (countries, regions, cities)
in plain text. Example:

[`north-america/countries.txt`](https://github.com/geraldb/world.db/blob/master/north-america/countries.txt):

```
ca, Canada,        CAN, 9_984_670,  34_278_406, un|north america
mx, Mexico,        MEX, 1_972_550, 112_322_757, un|north america
us, United States, USA, 9_629_091, 314_167_157, un|north america
```

[`europe/at/cities.txt`](https://github.com/geraldb/world.db/blob/master/europe/at/cities.txt):

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


## Frequently asked questions (F.A.Q.s)

Q: Why is Kanada spelled with a K and not a C? Why is Argentina spelled Argentien?

A: Look for the English version. In the German version Canada is spelled Kanada
and Argentina is spelled Argentinien.
 
Q: Why is country X missing?

A: It all started with Sportbook - an open source football pool for the Champions League.
Is a club from country X playing in the  Champions League 2012/13 season? If, yes, it is included
in the first commit. 


## Real World Usage

[world.db.admin](https://github.com/geraldb/world.db.admin) - A free, open source web admin tool for world.db in Ruby on Rails (version 3.2 and up).

[sport.db](https://github.com/geraldb/sport.db) - free open public domain sports database & schema.

[football.db](http://openfootball.github.io) -  free open public domain football (soccer) database & schema

[formula1.db](https://github.com/geraldb/formula1.db) - free open public domain Formula 1/Formula One database & schema

[ski.db](https://github.com/geraldb/ski.db) -  free open public domain ski alpin/alpine ski database & schema

[beer.db](http://openbeer.github.io) - free open public domain beer database & schema

[Sportbook](http://geraldb.github.com/sportbook) - A free, open source sports betting pool
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