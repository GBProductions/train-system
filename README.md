# _Train System_

#### _TRAINS! October 7th 2020_

#### By _**Garrett Brown, Vanessa Stewart, Ophelia Swen**_

## Description

_Train System is a program to map a train system, allowing train system operators to add, update, and delete information. Train riders can view information regarding the time and location they can ride a train._

## Setup/Installation Requirements

* _Open terminal_
* _type "cd desktop", then press enter_
* _type "git clone git@github.com:GBProductions/train-system.git", then press enter_
* _Run gem install bundler in command line to install Bundler_
* _Run bundle or bundle install in command line to download all dependencies_
* _Run tests in the command line with rspec_
* _Run application in browser by typing ruby app.rb in the terminal_
* _Choose browser of choice and enter in "localhost:4567"_

## Specifications
| Spec     | Behavior | Backend Action Items |
| -------- | -------- | -------------------- | 
| 1 | Train system operator can create, read, update, delete, and list trains. |  Create a Train class and give it it full CRUD functionality. |
| 2 | Train system operatpr can create, read, update, delete, and list citites where the trains will stop. |  Create a City class and give it it full CRUD functionality. |
| 3 | Train riders can view a train to see the cities where the train stops|  Create a method for the Train class that lists all cities the train stops at.|
| 4 | Train riders can view a city and see which trains come to it. | Create a method for the City class that lists all trains that come to it.|
| 5 | Train riders can see a timetable that shows what time each train stops in each city| |
| 6 | | Train riders can purchase a ticket in a particular city for a particular train so that the rider can get on and off in any city the train travels. |

## Known Bugs

_No known bugs_

## Technologies Used

* HTML
* CSS/Bootstrap
* Ruby
* Ruby Gems: Pry, PG, RSpec, Sinatra, Sintara-Contrib, Capybara

### License

*This program available under MIT License*

Copyright (c) 2020 **_Garrett Brown, Vanessa Stewart, Ophelia Swen_**


Co-authored by: Ophelia Swen <ophelia.swen@gmail.com>
Co-authored-by: Vanessa Stewart <vstewart1213@gmail.com>