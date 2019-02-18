# Salud360

[![Maintainability](https://api.codeclimate.com/v1/badges/c73a06f13786a69e4a4d/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/salud360/maintainability)

Página web para el manejo de información del programa salud 360

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Da Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Deploy project to heroku](#deploy-project-to-heroku)
* [Workflow](#Workflow)
* [Running specs](#running-specs)


### Client Details

| Name               | Email             | Role |
| ------------------ | ----------------- | ---- |
| Karina García | karigarciasr@gmail.com | Cliente |


### Environment URLS

* **Production** - https://sistemasalud360.herokuapp.com/
* **Development** - https://staging-sistemasalud360.herokuapp.com/

### Da team

| Name           | Email             | Role        |
| -------------- | ----------------- | ----------- |
| Mauricio Cortés |  A00816689@itesm.mx| Development |
| Victor Elizalde | A00817586@itesm.mx | Development |
| Hernan Iruegas | A00817021@itesm.mx | Development |
| Jorge Diaz | A01191342@itesm.mx | Development/Product Owner |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/)
* [Backlog]()
* [Heroku](https://crowdfront-staging.herokuapp.com/)
* [Documentation](https://drive.com)

## Development

### Setup the project

After installing please you can follow this simple steps:

1. Clone this repository into your local machine

```bash
$ git clone https://github.com/ProyectoIntegrador2018/salud360.git
```

2. Install gems and dependencies:

```bash
$ bundle install
```

3. Setup database:

```bash
$ rake db:setup
```

### Running the stack for Development

1. Fire up a terminal and run:

```bash
$ rails server
```

That command will start the server locally on port 3000.


Once you see an output like this:

```
web_1   | => Booting Puma
web_1   | => Rails 5.1.3 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | Listening on 0.0.0.0:3000, CTRL+C to stop
```

This means the project is up and running.

### Stop the project

In order to stop the server as a whole you can run:

```
% CTRL+C
```
### Deploy project to heroku

If you haven't created a heroku app in the project directory run:
```
% heroku create
```

You should see:
```
% Creating app... done
```

Then run, for future deployments on this app just use this command:
```
% git push heroku master
```
### Workflow
* Clone the repo locally in your computer
* Checkout ```develop``` branch/ and update it (Pull all changes up-to-date)
* Create a branch from develop
* Make your changes
* Create clean messages and commits
* Push your branch to the repo
* Make a PR to merge to develop
* Get review from other members
* Rebase and Merge branch to develop

(Note: We have 2 apps in heroku to create a development/staging and production pipeline)

* Manualy deploy in heroku the new changes from develop branch - https://dashboard.heroku.com/apps/staging-sistemasalud360/deploy/github
* Check correct changes and ask for approval from client in staging link
* After approval rebase and merge ```develop``` into ```master```
* Deploy master in https://dashboard.heroku.com/apps/sistemasalud360/deploy/github

(Optionally you can set heroku to deploy automatically when branch is pushed to github)


### Running specs

To run specs, you can do:

```
$ rspec
```

Or for a specific file:

```
$ rspec <test file path>
```
