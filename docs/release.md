## Release steps:

Update version at [version.rb](../lib/dputs/version.rb)
```sh
gem signin
gem build dputs
gem install ./dputs-X.X.X.gem # test locally
gem push ./dputs-X.X.X.gem
```