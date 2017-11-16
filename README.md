# README

"Fitboy" aims to be a reference, tracking, planning, and analysis tool for 
nutritional and supplemental information, exercise and activity logging, and observation tracking. 

The tool aims to incorporate the USDA's SR28 dataset--the official semi-annual publication of nutrient 
data covering a large majority of major foods, as well as the freely available, crowdsourced food information
dataset "open foods".

*This is a work-in-progress document.*

# Architecture

The application is split into several responsibilities: 
 * Provide nutritional data from multiple sources, including the government SR28 dataset and the OpenFoods DB.
 * Record activities (like meals, measurements, and exercise)
 * Analyze data (both for individuals and larger statistical groups)
 * Secure information access (for example, to allow a nutritionist to see nutrition logs for
patients, or a personal trainer to record and prescribe exercies, or a familty practitioner to mark food allergies, etc)
 * Provide a unified UI to access all functions.

## Offline-First

The app aims to be "offline first" in such that a subset of nutritional
data can be persisted to the browser/device in a small amount of storage, and therefore allow a majority
of functions to be performed on the client without the immediate need of the server. This approach 
allows a faster, smoother front-end experience, as connection stability and other factors will effect the
experience less, even when internet is available.

# Stack

The current stack for this application consists of the following technologies. Many more may be used
or are a requirement of another component, but these are the primary components:

## Backend

* Ruby v.2.3.1
* Rails 5
* PostgreSQL 10.0
* MongoDB 3.4
* Webpack

### Notable Gems

* Grape
* Grape Entity
* Webpack-rails - this has made the asset pipeline with regards to Typescript, React, etc, extremely painless.
* React-rails

## Frontend

The front end of the application is a ReactJS based application. Utilizes the "antd" design library, a
UI toolkit for React written in typescript.

# Running

__Instructions on populating initial datasets to come__

1. Start the DB servers.
2. Start the Rails backend (`rails s`)
3. Start the webpack backend (in development mode: `bin/webpack-dev-server`) in the background.
4. Point a browser to http://localhost:3000/
