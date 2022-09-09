# .NET Core
---

In this example, we have a .NET 5 (which is part of the .NET Core series; SDK-style project)
project, so we use the `dotnet.exe` CLI.

In SDK-style projects, all the metadata is included in the project file itself. We don't
need any nuspec file as we do with non-SDK style projects.

## Build the Project
First, build the project:
```
$ dotnet build
```

This built the `.dll` file along with some other files.

## Create the Package
Now let's pack the package:
```
$ dotnet pack
```

This will create the `.nupkg` file in `bin`.

## Publish the Package
Now that we have our `.nupkg` file, which is the package, we want to distribute it to a feed.
We have a feed in Azure Artifacts, in the `PipelinesExamples` project.

### Publish to Nuget.org
In order to publish to nuget.org, you need to have an API key from your nuget.org account.

Put your API key in the file `apikey` and run:
```
$ dotnet nuget push <.nupkg> -s nuget.org -k $(cat apikey)
```

### Publish to Azure Artifacts

We'll use our feed in the NuGet project in Azure DevOps.
Recall, our `nuget.config` defines a source named `azure` which points to this feed.

In order to authenticate, you'll need to add the username (any string will do I think)
and your Azure DevOps PAT as credentials for this source. Don't commit it to Git though.

```
$ dotnet nuget update source azure -u yoavklein25 -p <PAT> (in Linux: --store-passowrd-in-clear-text)
```

Now you can push the package to the feed
```
$ dotnet nuget push <.nupkg> -s azure -k az 
```

the `az` given to `-k` is arbitrary, any string will do.
