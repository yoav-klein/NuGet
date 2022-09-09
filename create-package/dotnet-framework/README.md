# .NET Framework
---

In this example, we have a .NET Framework (non-SDK-style project), so we use the `nuget.exe` CLI.

For your help, source the `Functions.ps1` file so that you'll have useful functions that you can use.

## Build the project
First, build the project with MSBuild. Use `Build-Project` function for this.

#### Set the version
Before you build, set the desired version in the `Properties/AssemblyInfo.cs`.

## Create the package
Basically, the flow is as such: We need to generate a `.nuspec` file, which contains
metadata about the package. Then, we run `nuget pack` to pack the package.

### Render a nuspec file
There are several ways to render the nuspec file, we'll use the project file for this.

### Use the project file
In this way, we use the `.csproj` file as a base to create the `.nuspec` file.

```
> nuget.exe spec
```

You can use the `Gen-Nuspec` function for this.

This creates a tokenized `.nuspec` file. Fields such as <id>, <version>, and more, will be tokenized, so you don't need to update those when you update the project.

When packaging, those values will be retrieved from the project.

However, there are some tokens that aren't replaced, such as Author, Descrition, etc. So you need to take care of them manually.
Edit the nuspec file as you want, and run

### Build the package

```
> nuget.exe pack
```

To create the `.nupkg` file.

Use the `Pack` function for this.

## Push the Package to a Feed
Now that we have our `.nupkg` file, which is the package, we want to distribute it to a feed.
We have a feed in Azure Artifacts, in the `PipelinesExamples` project.

We have a `nuget.config` file in the root of this repository. Nuget will use this file since Nuget
uses `nuget.config` files it meets in the way up to the root directory of the drive.

What you need to do is create a file named `apikey` in this directory, and put a PAT
from Azure DevOps there.
With this in place, you can push the package using the `Push-Package` function.

NOTE: You can't push 2 packages with the same version, even if you deleted it ! So you need to always update the version

### NOTE
There was some problem of retrieving the version number from the AssemblyInfo.cs file. This was fixed
by changing something in the `nuget.exe`. See:
https://stackoverflow.com/questions/71519166/nuget-pack-doesnt-read-assembly-version-from-visual-studio-project
 
### NOTE
