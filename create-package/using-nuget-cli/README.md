# Using NuGet CLI
---

In this example, we have a non-SDK-style project, so we use the `nuget.exe` CLI.

As you know, there are several ways to do this.

## Use the project file
In this way, we use the `.csproj` file as a base to create the `.nuspec` file.

```
> nuget.exe spec
```

This creates a tokenized `.nuspec` file. Fields such as <id>, <version>, and more, will be tokenized, so you don't
need to update those when you update the project. 

When packaging, those values will be retrieved from the project.
Edit the nuspec file as you want, and run
```
> nuget.exe pack
```

To create the `.nupkg` file.

