# Create a Package
---

In this directory we will create a `Logger` NuGet package and publish it.
We have 2 projects - one .NET Framework and the other .NET Core.


## Azure Artifacts
In order to publish the package to Azure Artifacts, we must have a feed
ready.
For this, we'll use a feed in the `NuGet` project.
So we have the `nuget.config` in the root of this repository which defines the `azure`
package source which we'll use to publish the packages to.

