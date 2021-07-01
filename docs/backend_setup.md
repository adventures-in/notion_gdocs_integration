# Backend Setup 

## Create firebase project & setup default service account

- create a project with the Firebase console 
- select "Spark plan" next to the project name and Select Blaze plan 
- with the Cloud Code extension: select the project and hit the "Enable Cloud Run API" 
- Now if we check Google Cloud console... APIs & Services... Credentials...
  - under Service Accounts there will be an entry with Name "Default compute service account"
- Run `gcloud auth application-default login` to save credentials locally

## Application Default Credentials (ADC)

> Adapted from [Authenticating as a service account](https://cloud.google.com/docs/authentication/production)

The `googleapis_auth` package provides a [clientViaApplicationDefaultCredentials](https://pub.dev/documentation/googleapis_auth/latest/auth_io/clientViaApplicationDefaultCredentials.html) function that automatically finds the appropriate service account credentials. ADC searches in the following order:

If the environment variable `GOOGLE_APPLICATION_CREDENTIALS` is set, ADC uses the service account key or configuration file that the variable points to.

If the environment variable `GOOGLE_APPLICATION_CREDENTIALS` isn't set, ADC uses the service account that is attached to the resource that is running the project code.

This service account might be a [default service account](https://cloud.google.com/iam/docs/service-accounts#default) provided by Compute Engine, Google Kubernetes Engine, App Engine, Cloud Run, or Cloud Functions. It might also be a [user-managed service account](https://cloud.google.com/iam/docs/service-accounts#user-managed) that you created.

### Setup for testing locally

Run `gcloud auth application-default login` to save credentials locally where `clientViaApplicationDefaultCredentials` will find them.

Relevant docs: 
- [clientViaApplicationDefaultCredentials](https://pub.dev/documentation/googleapis_auth/latest/auth_io/clientViaApplicationDefaultCredentials.html)
- [gcloud auth application-default login](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)