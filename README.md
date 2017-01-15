## Synopsis

JetLobster local APNs testing tool.

## Motivation

It's fast and easy to use.

## Usage

Clone repo and run bundle install (I assume that you have ruby and bundler).

```bash
$ ruby jet_lobster.rb --help
Usage: jet_lobster.rb [options]
JetLobster local APNs testing tool
Options:
    -t, --token TOKEN                device token
    -m, --message MESSAGE            Notification message
    -x, --host HOST                  APNS host, default is gateway.sandbox.push.apple.com
    -o, --port PORT                  APNS port, default is 2195
    -p, --pem PATH                   Path to pem file
    -b, --badge VALUE                Badge value, default is 1
        --other HASH                 Additional data sent with notification, deafult is a empty Hash
```

## License

   Copyright [2017] [Sławomir Onyszko]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.