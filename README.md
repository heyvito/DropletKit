# DropletKit
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

**DropletKit** is a Objective-C wrapper for the [DigitalOcean API](https://developers.digitalocean.com).

## Usage

> First, you will need an access token. You can generate one by yourself through the [Control Panel](https://cloud.digitalocean.com/settings/applications), or by requesting
access through the [OAuth endpoints](https://www.digitalocean.com/community/tutorials/how-to-use-oauth-authentication-with-digitalocean-as-a-user-or-developer).

`DropletKit` is created as a singleton (i.e. it doesn't need to be explicitly allocated and instantiated; you directly call `[DKClient method]`). So, after getting an access token, you must provide it to the library:

```objectivec
[DKClient setAuthenticationToken:@"ACCESSTOKEN"];
```

Now you are ready to perform requests to DigitalOcean's Endpoints:

```objc
[[DKClient sharedInstance] getAccountInfo].then(^(DKUser *user) {
    NSLog(@"Authenticated user email: %@, UUID: %@", user.email, user.uuid);
})
.catch(^(NSError *error){
    NSLog(@"Error getting account data: %@", error)
});

```

## TODO
 * Implement Floating IP support.
 * Automatically fill ratelimit-related properties.
 * Implement methods to create new Domains, ~Droplets~, and SSH Keys.

## License

```
The MIT License (MIT)

Copyright (c) 2015 Victor Gama de Oliveira

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
