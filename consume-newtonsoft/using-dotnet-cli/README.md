# Install Newtonsoft
---

This is the most basic example of installing a nuget package.
In this example, we have an application targeting `.NET 5`, so we use `dotnet.exe`.

This is done following the Quickstart example in the docs:
https://docs.microsoft.com/en-us/nuget/quickstart/install-and-use-a-package-using-the-dotnet-cli

After we ran the `dotnet add package ` command, the package is recorded in the `.csproj` file, and all you need to do now is to run `dotnet restore`

```
# make sure local cache is clear
> dotnet nuget locals all --clear
# resotre package
> dotnet restore
# see package in cache
> ls ~/.nuget
# run program
> dotnet run
```
