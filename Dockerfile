# Stage 1: Build the .NET application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Copy the .csproj file and restore dependencies
COPY src/Web/Web.csproj ./src/Web/
RUN dotnet restore ./src/Web/Web.csproj

# Copy the remaining project files
COPY . .

# Run npm install if package.json exists
WORKDIR /src/src/Web
RUN if [ -f "package.json" ]; then npm install; fi

# Publish the application
RUN dotnet publish ./Web.csproj --os linux --arch x64 -c Release --self-contained true -o /app/publish

# Stage 2: Create the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Set the entry point for the application
ENTRYPOINT ["dotnet", "CleanArchSample.Web.dll"]

# Expose port 80
EXPOSE 80