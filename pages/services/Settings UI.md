# Settings Frontend

Global application's settings frontend for console.redhat.com

## Usage

This project uses [Data Driven Forms](https://data-driven-forms.org/).

### Prerequisites

1. Your application must be active in the [Cloud Services Config source of truth](https://github.com/RedHatInsights/cloud-services-config) with the `api` field.
2. Your API must have a `GET` and `POST` endpoint at `/api/{appName}/{version}/settings`.

### GET and POST endpoints

#### GET

Your `GET` endpoint will return an array in the format provided by [Data Driven Forms](https://data-driven-forms.org/).

Example:

``` json
[
    {
        "fields": [
            {
                "component": "checkbox",
                "label": "Checkbox",
                "name": "checkbox",
                "isRequired": true,
                "validate": [{
                    "type": "required-validator"
                }]
            },
            {
                "name": "conditionalTextField",
                "label": "When checkbox is checked!",
                "component": "text-field",
                "condition": {
                    "when": "checkbox", // name of controlled field
                    "is": true, // condition
                }
            }
        ]
    }
]
```

There is a [live editor](https://data-driven-forms.org/live-editor) where you can test the schema before implementing it.

#### POST

The `POST` endpoint will receive the submitted values

## Dev Instructions
* `npm install`

### Proxy/Routing
#### Using insights [frontend-components](https://github.com/RedHatInsights/frontend-components/tree/master/packages/config)
* Edit `dev.webpack.config.js` to add route for local backend API server(If needed)
  
Example: 
``` javascript
const webpackProxy = {
  deployment: process.env.BETA ? 'beta/apps' : 'apps',
  useProxy: true,
  env: `${process.env.ENVIRONMENT || 'ci'}-${
    process.env.BETA ? 'beta' : 'stable'
  }`, // for accessing prod-beta start your app with ENVIRONMENT=prod and BETA=true
  appUrl: process.env.BETA ? '/beta/settings/applications' : '/settings/applications',
  routes: {
    '/api/cost-management/v1/': { host: 'http://localhost:8000' },
    ...(process.env.CONFIG_PORT && {
      [`${process.env.BETA ? '/beta' : ''}/config`]: {
        host: `http://localhost:${process.env.CONFIG_PORT}`,
      },
    }),
  },
};

```

* Run `npm run start:proxy`

If you want to run on beta environment just run `BETA=true npm run start:proxy`

If you want to run on different environmnent other than just `ENVIRONMENT=edge npm run start:proxy`

#### Using [insights-proxy](https://github.com/RedHatInsights/insights-proxy)
* Just run `npm start` it will start serving your assets over webpack dev server, you also have to run the spandx proxy.

* edit `settings-frontend/profiles/local-frontend-and-api.js`
  (changing the port and path to local proxy server, if needed)
* Run `npm run start`
* Run `SPANDX_CONFIG=path/to/settings-frontend/profiles/local-frontend-and-api.js sh path/to/insights-proxy/scripts/run.sh`
