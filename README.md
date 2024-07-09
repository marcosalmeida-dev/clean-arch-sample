# CleanArchSample

The project was generated using the [Clean.Architecture.Solution.Template](https://github.com/jasontaylordev/CleanArchSample) version 8.0.5.

## Build

Run `dotnet build -tl` to build the solution.

## Run

You can run using Docker:
https://www.docker.com/products/docker-desktop/
```bash
docker-compose up --build;
```

OR

To run the web application:

```bash
cd .\src\Web\
dotnet watch run
```

Navigate to https://localhost:5001. The application will automatically reload if you change any of the source files.

In both ways you need to have SQL Server instance running locally, you can use docker or local instance.
PS: I know is not a good practice to use SA as DB User, but I leave it this way to avoid permissions issues to create database and run migrations.

## Code Styles & Formatting

The template includes [EditorConfig](https://editorconfig.org/) support to help maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs. The **.editorconfig** file defines the coding styles applicable to this solution.


## Test

The solution contains unit, integration, functional, and acceptance tests.

To run the unit, integration, and functional tests (excluding acceptance tests):
```bash
dotnet test --filter "FullyQualifiedName!~AcceptanceTests"
```

To run the acceptance tests, first start the application:

```bash
cd .\src\Web\
dotnet run
```

Then, in a new console, run the tests:
```bash
cd .\src\Web\
dotnet test
```

## Help
To learn more about the template go to the [project website](https://github.com/jasontaylordev/CleanArchitecture). Here you can find additional guidance, request new features, report a bug, and discuss the template with other users.