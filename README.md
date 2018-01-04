# GEO Exercise

## Exercise
We have provided mini-schema.xml (please rename as .zip and extract).

1.       Write webserver with a REST API to get the notes for a device. This will need to parse the xml and return the appropriate notes given device name as a parameter of the REST call
2.       Write a test script to test the operation of the webserver
3.       Wrap this script in a unit test framework
4.       Enhance the test script to explore the result of verbs other than ‘get’ (which should fail)
5.       Enhance the webserver and tests to return all devices

## Install
This uses Ruby so ensure that ruby has been installed already. If it has not been installed, you can follow the instructions in the link below.

https://www.ruby-lang.org/en/documentation/installation/

There are a variety of gems that I have used for this and they are all in the Gemfile. To install these gems just enter the command in the terminal.

```
bundle install
```

## Run tests
To run the tests, just put ```rspec``` into the terminal
