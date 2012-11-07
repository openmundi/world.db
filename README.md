Welcome to `world.db`
=====================

A Free Open World Database & Schema


## Usage

Get a copy of the `world.db` file. That's it.

![](https://raw.github.com/geraldb/world.db/master/i/sqlitestudio.png)

## Demo

Try the `world.db` Web Admin demo running
on Heroku [`worlddb.herokuapp.com`](http://worlddb.herokuapp.com).

## Tables, Schema

The `world.db` includes the following tables:

* countries
* regions
* cities


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
      "capital" boolean DEFAULT 'f' NOT NULL,
      "created_at" datetime NOT NULL,
      "updated_at" datetime NOT NULL
    );


## Command Line Tool

    worlddb - world.db command line tool, version 0.2.0
    
    Usage: worlddb [options]
        -c, --create                     Create DB Schema
            --delete                     Delete all records
            --load                       Use Loader for Builtin World Data
        -i, --include PATH               Data Path (default is .)
        -v, --version                    Show version
            --verbose                    Show debug trace
        -h, --help                       Show this message
    
    
    Examples:
        worlddb at/cities                      # import austrian regions n cities
        worlddb -c                             # create database schema



## Build Your Own `world.db` Version

Step 1:  Create an empty database, that is, `world.db`. Issue the command:

    worlddb --create

Step 2:  Add your countries, regions and cities of choice. For example,
let's use the Austrian and German cities and regions:

    worlddb --include <your_path_to_fixtures> at/cities de/cities

That's it.



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

[sport.db](https://github.com/geraldb/sport.db) - A free, open sports database & schema.

[Sportbook](http://geraldb.github.com/sportbook) - A free, open source sports betting pool
in Ruby on Rails (version 3.2 and up). 


## Alternatives

[worlddb](http://code.google.com/p/worlddb) -  Open World Database alpha; includes country, region & city names in many languages names and latitude and longitude numbers and country's iso 2-letter code.

## License

The `world.db` schema, data and scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Open Sports Database & Friends Forum/Mailing List](http://groups.google.com/group/opensport). Thanks!