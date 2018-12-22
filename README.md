Slack Pin Aword
================================================

Usage.
------------------------------------------------

### Configuretion

#### 1. Evnvironment

Copy `env.example` to `.env`.
Override `.env`

```
SLACK_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

or

If you use Heroku

```
$heroku config:set SLACK_TOKEN=xxxxxxxxxxxxxxxxxxxxx
```

#### 2. Migration

```
$ bundle exec rake db:migrate
```

#### 3. Import Slack Pin

```
$ bundle exec bin/pin2018
```
