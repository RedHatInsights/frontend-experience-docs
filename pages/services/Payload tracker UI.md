- [Payload Tracker Frontend](#payload-tracker-frontend)
  - [Overview](#overview)
  - [Architecture](#architecture)
  - [Routes](#routes)
  - [Basic Usage](#basic-usage)
  - [Docker](#docker)
  - [Prequisites](#prequisites)
  - [Dev Setup](#dev-setup)
  - [Dev Setup using Docker](#dev-setup-using-docker)
  - [Dev Testing](#dev-testing)
  - [Contributing](#contributing)
  - [Versioning](#versioning)

Payload Tracker Frontend
===========================================


Overview
--------------------

The Frontend for the Payload Tracker is aimed to create a easy-to-use interface in which to access the data created and stored by the Payload Tracker Service. The Service exposes a REST API to which we can make calls.

This application uses webpack for distribution, and is based on the `patternfly-react-seed` repository. The main components are found in the `track`, `payloads`, and `statuses` directories. These components return full page views which are navigable via `react-router`.


Architecture
--------------------

Payload Tracker Frontend lives in `platform-<env>`. We are using nginx to coordinate connections between the Payload Tracker Service and the frontend component views. These views are stored within the `build` directory of the nginx container.

The frontend itself manages state using a Redux store. We are using react-router to manage our routing using history and the store. Urls are managed using a custom middleware which can be found in the `middlewares` directory.


Routes
--------------------

The Payload Tracker Frontend can be accessed at the following routes.
```
<Route path='/' exact render={() => <Redirect to='/payloads'/>}/>
<Route path='/payloads' component={Payloads}/>
<Route exact path='/track' component={Track}/>
<Route path='/track/:request_id' component={Track}/>

```


Basic Usage
--------------------

The frontend allows for developers to easily view and share payloads as they pass through the platform. The `/track:request_id` allows for developers to understand where errors occur, what the errors are, and how quickly payloads are passing in between services and within individual services.


Docker
--------------------

This repo contains a Dockerfile and Dockerfile-dev. The Dockerfile creates the full nginx production build of the application, while Dockerfile-dev creates an image suitable for a dev environment. It does this by speeding up build time by using the locally built version of the `dist` directory.


Prequisites
--------------------
    docker
    docker-compose


Dev Setup
--------------------
1. Install dependencies
```
npm i
```

2. Setup Payload Tracker Service <https://github.com/RedHatInsights/payload-tracker-go#development>

3. Start Frontend
```
npm run start
```

Your frontend is running on [http://localhost:3000/app/payload-tracker/](http://localhost:3000/app/payload-tracker/).

**Note:** This will yield CORS errors. Consider installing <https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf> to remove these errors.

Dev Setup using Docker
--------------------
1. Install dependencies
```
npm i
```

2. Create build
```
npm run build
```

3. Setup Payload Tracker Service <https://github.com/RedHatInsights/payload-tracker-go#development>

4. Build Frontend
```
docker build . -f Dockerfile-dev -t frontend:latest
```

**Note:** If you are using Docker for Mac pass the argument `--build-arg SERVICE_HOST=docker.for.mac.localhost` to `docker build`. `SERVICE_HOST` can be set to any value as to match the correct location of the Payload Tracker Service.

5. Stand up Frontend
```
docker run -p 8080:8080 frontend:latest
```

**Note:** There is a draw back to using this method to do frontend development, which is inherent in the use of nginx to provide files from the `build` directory. In order to apply changes occurring in the frontend, we need to do the following:

1. Rebuild frontend
```
npm run build
```

2. Restart Environment
```
docker build . -f Dockerfile-dev -t frontend:latest && docker run -p 8080:8080 frontend:latest
```

Contributing
--------------------
All outstanding issues or feature requests should be filed as Issues on this Github
page. PRs should be submitted against the master branch for any new features or changes.


Versioning
--------------------
Anytime an endpoint is modified, the version should be incremented by `0.1`. New
functionality introduced that may effect the client should increment by `1`. Minor
features and bug fixes can increment by `0.0.1`

CVE Remediation
-------------------- 
Steps to remediate Common Vulnerablitiles and Exposures (CVE)

Prequisites: 
- Check if the latest merged commit is in quay as a tag. 
- Check if the tag/commit has any vulnerabilities under the Security Scan Section.

If Security Scan has vulnerabilites: 
1. Fork project, and create a new branch in your fork. 
2. Usually, to remediate the majority of the CVE's is to update the UBI8 image. Since it is already pulling from 'latest', all we need is to trigger the pipeline and merge it in. 
     ```
    git commit --allow-empty -m "Empty-Commit"
    ```
**Note:**  If it is not an image update, update packages in package-lock.json or package.json with the recommended version. 
3. Push that commit and create a MR for the team to review. 
4. Check prerequisites again. Follow below section after all vulnerabilites have passed. 

If Security Scan states "Passed":
1.  Go to App Interface
2.  Create an MR to update the ref hash in prod namespace
    To get the full hash, go on the master branch on RedHatInsights/payload-tracker-frontend 
    ```
    git log -1 --pretty=format:"%H"
    ```
3. Ask the team to review and update Jira with the link to the MR


