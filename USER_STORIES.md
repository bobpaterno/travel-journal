# User Stories

## Features
  * Create locations
  * Create landmarks
  * Create journal entries
  * List locations
  * List landmarks
  * View specific journal entries

## User Types
  * World Travelers: People who want a written record of where they've been

# Stories
## World Traveler Enters a Location
As a world traveler
in order to enter a new location
I want to specify the country, city, and latitude/longitude

Usage
* World traveler is prompted with "New or View" and types `new`
* Prompt is "New what? (1. location, 2. landmark, 3. journal entry)"
* World traveler types `1` for location
* World traveler is prompted to fill in the location's
  * City
  * Country
  * Latitude
  * Longitude
Acceptance Criteria
* Duplicate locations are not allowed
* Saves to database



## World Traveler Views a list of Locations
As a world traveler
in order to view all locations
I want to see a list of the cities and countries

Usage
* World traveler is prompted with "New or View" and types `view`
* Prompt is "View what? (1. locations, 2. landmarks, 3. entries)"
* World traveler types `1` to view all locations

Acceptance Criteria
* A list of all locations is displayed (read from database)



## World Traveler Enters a Landmark
As a world traveler
in order to enter a new landmark
I want to specify the location, a landmark name, and it's description

Usage
* World traveler is prompted with "New or View" and types `new`
* Prompt is "New what? (1. location, 2. landmark, 3. journal entry)"
* World traveler types `2` for landmark
* World traveler lists all locations and is prompted to select a location
* World traveler selects a location number (e.g. `2`) and is then prompted to enter the landmark's
  * Name

Acceptance Criteria
* Duplicate landmarks are not allowed
* Saves to database



## World Traveler Views a list of Landmarks
As a world traveler
in order to view all landmarks
I want to see a list of the landmarks

Usage
* World traveler is prompted with "New or View" and types `view`
* Prompt is "View what? (1. locations, 2. landmarks, 3. entries)"
* World traveler types `2` to view landmarks
* Prompts to `1` see all or `2` see by location

Acceptance Criteria
* A list of all landmarks is displayed (read from database)


## World Traveler Makes a Journal Entry
As a world traveler
in order to remember where I was and what I did when,
I want to enter my recollections to the travel journal

Usage
* World traveler is prompted with "New or View" and types `new`
* Prompt is "New what? (1. location, 2. landmark, 3. journal entry)"
* World traveler types `3` for journal entry
* World traveler sees a list of all locations and is prompted to select a location
* World traveler selects a location number (e.g. `2`) and is then prompted to make
  * A journal entry

Acceptance Criteria
  * The date is automatically recorded
  * Saves to database


## World Traveler Views Journal Entries by Location

## World Traveler Views Journal Entries by Landmark

## World Traveler Views All Landmarks in a Location they have written about
