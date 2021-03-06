## RDW_Ingest

Table of Contents:
* [Project Summary](#project-summary)
* [Building](#building)
* [Running](#running)
* [Loading Data](#loading-data)


### Project Summary
Additional documentation:
* RDW_Ingest is part of the RDW suite of projects and applications. For all things RDW please refer to 
[RDW repo](https://github.com/SmarterApp/RDW)
* [Change log](CHANGELOG.md)
* [Contributing developer notes](CONTRIBUTING.md)
* [License](LICENSE)

RDW Ingest applications:
* Import Service - RESTful API for submitting test results (exams), packages, etc.
* Exam Processor - Spring Cloud Stream application for processing test results.
* Group Processor - Spring Cloud Stream application for processing student groups.
* Package Processor - Spring Cloud Stream application for processing assessment packages, accommodations, organizations.
* Task Service - Spring Boot application for running scheduled tasks.
* Migrate Reporting - Spring Boot application for migrating data from the warehouse to the reporting data mart.
* Migrate OLAP - Spring Boot application for migrating data from the warehouse to the aggregate reporting OLAP.

RDW Ingest uses other processes:
* MySQL/Aurora - warehouse and reporting databases
* Redshift - aggregate reporting OLAP databse
* RabbitMQ - message queue
* Configuration Server - centralized Spring configuration server
* OpenAM - centralized auth server
* ART - Administration and Registration Tools

RDW Ingest uses other projects. These are published to publicly available repositories but having a local 
copy may be convenient for reference or troubleshooting:
* [RDW_Common](https://github.com/SmarterApp/RDW_Common)
* [RDW_Schema](https://github.com/SmarterApp/RDW_Schema)


### Building
The following tools are need to build and test:
* Java 8.
* Gradle. The project uses bundled gradle so no explicit installation is required. However, it is highly 
recommended to install gdub (https://github.com/dougborg/gdub) because it handles some shortcomings of 
gradle's commandline behavior. The instructions assume this, using `gw` instead of `./gradlew` or `gradle`.
* Docker. The applications are distributed as docker images. Install the latest docker on your machine
and configure it to have at least 4GB of memory available.
* MySQL 5.6/5.7. Required for running integration tests. Please refer to the [RDW Schema](https://github.com/SmarterApp/RDW_Schema) 
project for instructions on setting up MySQL.

Build and test ingest apps from where you cloned this project (the `it` task triggers the integration tests):
```bash
git clone https://github.com/SmarterApp/RDW_Ingest
cd RDW_Ingest
git checkout develop
gw build it
```

Code coverage reports can be found in each project under `./build/reports/coverage/index.html` after 
explicitly generating them using:
```bash
gw coverage
```

If you want to run the integration tests against Aurora (instead of the local MySQL) you should set environment
variables with the required credentials for the CI (or other appropriate) database instance. Note that the way things
work for this, all the schemas must live in the same database server (so reporting and warehouse can't be separate
servers). The users may be different (but for CI they are the same). The `ORG_GRADLE_PROJECT_*` variables are passed
into the gradle environment so the RDW_Schema commands are applied to the correct database. The `DATASOURCES_*_*` are
used by the Spring Boot ITs. And the temporary variables are just to avoid some duplication.
```bash
(SERVER=rdw-aurora-ci.cugsexobhx8t.us-west-2.rds.amazonaws.com:3306; USER=sbac; PSWD=password; \
 export ORG_GRADLE_PROJECT_database_url=jdbc:mysql://$SERVER/; \
 export ORG_GRADLE_PROJECT_database_user=$USER; export ORG_GRADLE_PROJECT_database_password=$PSWD; \
 export DATASOURCES_WAREHOUSE_RW_URL_SERVER=$SERVER; \
 export DATASOURCES_WAREHOUSE_RW_USERNAME=$USER; export DATASOURCES_WAREHOUSE_RW_PASSWORD=$PSWD; \
 export DATASOURCES_REPORTING_RW_URL_SERVER=$SERVER; \
 export DATASOURCES_REPORTING_RW_USERNAME=$USER; export DATASOURCES_REPORTING_RW_PASSWORD=$PSWD; \
 gw it)
```

The integration tests dealing with Redshift have been separated out because they require remote AWS resources
and they take a while to run. To run these tests you must set credentials -- please see the comment in 
migrate-olap/build.gradle. By default it uses the CI database instances:
```bash
(export ARCHIVE_CLOUD_AWS_CREDENTIALS_SECRETKEY=secretkey; \
 export DATASOURCES_MIGRATE_RW_PASSWORD=password; \
 export DATASOURCES_OLAP_RW_PASSWORD=password; \
 export DATASOURCES_WAREHOUSE_RW_PASSWORD=password; \
 gw rst)
```

You must explicitly build the docker images:
```bash
$ gw dockerBuildImage
$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
smarterbalanced/rdw-ingest-import-service        latest              fc700c6e8518        14 minutes ago      131 MB
smarterbalanced/rdw-ingest-exam-processor        latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```
To publish the docker images you must provide docker hub credentials, either on the commandline or
as settings in `grade.properties`:
```bash
$ gw dockerPushImage
```

After cycling through some builds you will end up with a number of dangling images, e.g.:
```bash
docker images
REPOSITORY                          TAG                 IMAGE ID            CREATED             SIZE
smarterbalanced/rdw-ingest-import-service    latest              ad78b95ae39f        2 minutes ago       140 MB
<none>                              <none>              13b96a973d59        About an hour ago   140 MB
<none>                              <none>              cb5063cbcc56        2 hours ago         140 MB
<none>                              <none>              2236259b73f0        3 hours ago         140 MB
smarterbalanced/rdw-ingest-exam-processor    latest              293d8744377d        3 hours ago         132 MB
<none>                              <none>              bdae5c1151d5        24 hours ago        140 MB
<none>                              <none>              233d2f87c185        24 hours ago        132 MB
```
These can be quickly cleaned up with standard Docker hygiene:
```bash
docker container prune -f
docker image prune -f
```

### Running
These are instructions for running the RDW_Ingest applications locally. To deploy these applications
as part of the full Smarter Balanced RDW ecosystem, please refer to [RDW](https://github.com/SmarterApp/RDW).

Running the applications locally depends on the local database being configured properly.
Please refer to the [RDW Schema](https://github.com/SmarterApp/RDW_Schema) project for that.

The OLAP applications require remote AWS data stores being configured properly. Care should be taken because these
remote resources are often shared; also misconfiguration could result in actions being taken on the wrong database.

**NOTE** - The configuration server requires a backing git repository with proper configuration files,
including configuration settings for the `local-docker` profile. Without that, the system will not
run properly. (It is beyond the scope of this document to describe how to set that up.)   

**TODO** - change the project so it can run without a configuration server; see TIMS  

The apps are wrapped in docker containers and should be built and run that way. There is a docker-compose spec
to make it easy: it runs RabbitMQ, the configuration server and all the RDW_Ingest applications. Please read the
comments in the docker-compose script for setting required environment variables. Then invoke docker-compose, e.g.:
```bash
docker-compose up -d
docker logs -f docker_import-service_1
```
To stop a single service, use regular docker commands; to stop them all use docker-compose, e.g.:
```bash
docker stop docker_import-service_1
docker-compose down
```

### Loading Data
You may have access to a MySQL dump for running and testing locally, shortcutting 
the work needed to properly load data through the ingest pipeline. To load it:
```bash
mysql -h localhost -u root < mysql.dmp
```

To properly load data into the system involves a few steps. The supporting data must be loaded before test results
can be submitted. This includes assessments, accommodations, organization data, and groups. 
1. Get and load configurable subjects in XML format. These may be found in the [RDW repo](https://github.com/SmarterApp/RDW), in the `deploy` folder.
1. Get and load assessment packages in tabulator output. Usually for a given year.
1. Get accessibility codes. This is an XML payload provided by SB.
1. Use the Data Generator to generate sample TRTs and associated organization.json from the assessment package.
1. Load the generated organizations into the system.
1. Load the generated TRTs into the system.
1. Define student groups and user membership. Since the generated test results have student groups specified this 
simply requires associating your favorite user login with one-or-more of those groups.

This assumes you are running the ingest pipeline locally with normal configuration. If you are doing this against
a more production-like environment you'll need to replace the access token and edit submit_xml.sh appropriately.

The data generator project has some sample output that may be used to generate data and load everything
(yes, this is cloning the data generator project but still using the docker image to do the work; if you really want
you can run the data generator directly from source but that is left as an exercise for the reader):
```bash
git clone https://github.com/SmarterApp/RDW_DataGenerator
cd RDW_DataGenerator
docker run -v `pwd`/out:/src/data_generator/out -v `pwd`/in:/src/data_generator/in fwsbac/rdw-datagen --state_type tiny --gen_iab --gen_ica --gen_item --xml_out --pkg_source /src/data_generator/in
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./in/sbac_subjects.xml" http://localhost:8080/subjects/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./in/FULL_2016.items.csv" http://localhost:8080/packages/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./in/accommodations.xml" http://localhost:8080/accommodations/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./out/organization.json" http://localhost:8080/organizations/imports
./scripts/submit_xml.sh
```
The data generator does weird stuff with groups and sessions but generating groups using sessions produces reasonable
groups (at least for the session subject). This SQL query produces output that may be used to populate a groups CSV
file for import (you might further restrict the result by school, assessment, etc.):
```sql
select e.session_id as group_name,
  sc.natural_id as school_natural_id,
  e.school_year,
  case when a.subject_id = 1 then 'Math' else 'ELA' end as subject_code,
  st.ssid as student_ssid,
  concat(left(e.session_id, 3), '@test.com') as group_user_login
from exam e
  join asmt a on e.asmt_id = a.id
  join student st on e.student_id = st.id
  join school sc on e.school_id = sc.id
where e.school_year = 2018
order by e.session_id;
```
