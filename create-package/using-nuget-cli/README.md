# Using NuGet CLI
---

In this example, we have a non-SDK-style project, so we use the `nuget.exe` CLI.

For your help, source the `Functions.ps1` file so that you'll have useful functions that you can use.

## Build the project
First, build the project with MSBuild. Use `Build-Project` function for this.

## Create the package
Basically, the flow is as such: We need to generate a `.nuspec` file, which contains
metadata about the package. Then, we run `nuget pack` to pack the package.

There are several ways to render the nuspec file:

### Use the project file
In this way, we use the `.csproj` file as a base to create the `.nuspec` file.

```
> nuget.exe spec
```

You can use the `Gen-Nuspec` function for this.

This creates a tokenized `.nuspec` file. Fields such as <id>, <version>, and more, will be tokenized, so you don't
need to update those when you update the project.

When packaging, those values will be retrieved from the project.

However, there are some tokens that aren't replaced, such as Author, Descrition, etc. So you need to take care of them manually.
Edit the nuspec file as you want, and run

#### Set the version
Set the desired version in the `Properties/AssemblyInfo.cs` file before you pack.

### Build the package

```
> nuget.exe pack
```

To create the `.nupkg` file.

Use the `Pack` function for this.

## Push the Package to a Feed
Now that we have our `.nupkg` file, which is the package, we want to distribute it to a feed.
We have a feed in Azure Artifacts, in the `PipelinesExamples` project.

Copy the `nuget.config` file from the repository root to here. It defines our feed as a source named `py` (don't ask why).
With this in place, you can push the package using the `Push-Package` function.


## NOTE
There was some problem of retrieving the version number from the AssemblyInfo.cs file. This was fixed
by changing something in the `nuget.exe`. See:
https://stackoverflow.com/questions/71519166/nuget-pack-doesnt-read-assembly-version-from-visual-studio-project
 