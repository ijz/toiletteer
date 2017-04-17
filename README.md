## Code Example

N/A

## Motivation

I wanna know where I can pee and poop.

## Stuff used

* Postgres
* Spring Boot

## Installation

#### Test Postgres
A dev/test Postgres RDS is running on t2.micro. Should be free.
JDBC URL: `jdbc:postgresql://toiletteer.cbtzhgasa55h.us-west-2.rds.amazonaws.com:5432/toiletteer`
Username: `toiletteer`
Password:

#### Dependencies
```
sudo apt-get install oracle-java8-installer maven postgresql-client
```
#### Build
```
cd ~/workspace/toiletteer
mvn compile
mvn spring-boot:run
```
To make sure things are working correctly, do
```
curl localhost:8080/ping
```
You should see `hello world!` as output.

## API Reference

* `/ping`
* `/users/fb_login` STUB. Returns "your face"
* `/users/list` Test API for hibernate stuff

## Tests

LOL.

## Contributors

Me, and maybe, Mark?

## License

License No. 2
