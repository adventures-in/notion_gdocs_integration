# notion_gdocs_integration

Integrating Google Docs/Slides/Sheets and Notion.

[Notes](https://www.notion.so/adventures-in/Notion-Google-Docs-be096d5a6e404239b11c070d7d36ef64)

Using: 
- [functions-framework-dart](https://github.com/GoogleCloudPlatform/functions-framework-dart) 
- [googleapis](https://pub.dev/packages/googleapis)

## Setup 

[Backend Setup](docs/backend_setup.md) including: 
  - Using Application Default Credentials

## Running locally with Docker

Run in a container with Docker:

```sh
docker build -t app_img .
docker run -it -p 8080:8080 --name app app_img
```

## Running locally

```shell
dart run build_runner build
dart run bin/server.dart
```

## Cleaning up

When finished, remove the container & the image: 

```shell
docker rm -f app
docker image rm app_img
```