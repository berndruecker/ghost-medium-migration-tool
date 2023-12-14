# ghost-medium-migration-tool
Dockerimage to run the "Migrate Medium Export" tool from Ghost (see https://github.com/TryGhost/migrate/tree/main/packages/mg-medium-export)

Build Docker image:
```
docker build . -t berndruecker/migrate-medium-to-ghost
```

Run on Linux:
```
docker run -v ${PWD}/medium-export.zip:/input.zip  berndruecker/migrate-medium-to-ghost
```

Run on Windows:
```
docker run -v %cd%/medium-export.zip:/input.zip  berndruecker/migrate-medium-to-ghost
```
