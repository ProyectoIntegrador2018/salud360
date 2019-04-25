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

### Deploying manually 
* Enter:
    * Staging: https://dashboard.heroku.com/apps/staging-sistemasalud360/deploy/github
    * Production:  https://dashboard.heroku.com/apps/sistemasalud360/deploy/github
* Scroll down to `Manual deploy`
* Select desired branch to deploy
* Click on `Deploy Branch`
