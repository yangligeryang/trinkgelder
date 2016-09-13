# CodePath pre-work

**Trinkgelder** is a tip calculator application for iOS.

Submitted by: **Yang (Linda) Yang**

Time spent: **8** hours spent in total

## Tasks

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Custom font
* [x] UI animations
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] User location permissions and detection, as shown in bottom bar
- [x] Rudimentary implementation of dynamic currency based on user location (not locale)
- [x] Rudimentary implementation of tip percentages based on user location (values based on cultural expectations of country)
- [x] Emoji "reaction" labels instead of percentage values for tip percentages
- [x] App icon

## Walkthrough

Here's a walkthrough of implemented user stories:

![Trinkgelder video walkthrough](https://raw.githubusercontent.com/yangligeryang/trinkgelder/master/trinkgelder.gif?token=AA4y7Pf8HpnAd5JHC1GEHW0__5DLARs9ks5X4NwywA%3D%3D)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

My primary idea and goal was to create a travel tip calculator that you can use to calculate tips when you travel to other countries. This came out of a recent travel experience. With limited internet and information, it's hard to know how to tip appropriately and avoid offending or overcompensating.

Percentage values are symbols of our reactions to customer service. I feel that emoji better represent what we really mean when we decide tip percentage. I tried to add a max input limit and real-time formatting for the bill field but it proved too complicated and less interesting. The animation is a bit wonky and very basic, but again, it wasn't my focus.

## License

    Copyright 2016 Yang Linda Yang

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
