# Docker Puppet ASP.NET Example

The [Puppet Docker module](https://forge.puppetlabs.com/garethr/docker)
is a great way of installing and managing Docker on a host, but it also
allows for some basic container management.

This repo contains a fairly simple example using Vagrant to launch a Linux
virtual machine, then Puppet to install Docker, build an image and run a
container. For added spice the container runs a ASP.NET vNext application.

The ASP.NET vNext application example is taken from this excellent blog
post from MSDN about [running ASP.NET apps in linux
containers](http://blogs.msdn.com/b/webdev/archive/2015/01/14/running-asp-net-5-applications-in-linux-containers-with-docker.aspx).

## Usage

    vagrant up --provider virtualbox
    vagrant provision

This will take a little time as it launches a virtual machine and
downloads lots of software onto it.

## What happened?

Once up you should be able to access [10.20.1.11:5004](http://10.20.1.11:5004/)
and it should show the hello world ASP.NET example.

The text is coming from a docker container on the host `app1`.


## Under the hood

1. The instance (`app1`) installs docker, builds an image using the
   [Dockerfile](modules/application/files/vnext/Dockerfile) and runs a
   container based on that image.

The interesting Puppet code is found in the [application
module](modules/application/manifests/init.pp).
