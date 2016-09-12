# FAQ

FAQ is an iOS library that makes building an FAQs section into your app super simple.

![](https://reddavisus.s3.amazonaws.com/kibako/B32E1B18-338F-4222-9B18-AFA7B2DF6C0F/495386573-gif.gif)

## Install

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'FAQ', :git => 'TODO'
```

## Example

Just initialize the controller and present it!

```
let FAQViewController = FAQController(URL: NSURL(string: "https://red.to/test.json")!)
self.presentViewController(FAQViewController, animated: true)
```


## FAQ JSON

The JSON file should look like:

```
{
    "title": "Cooking FAQ's",
    "actionType": "navigation",
    "data": [
        {
            "title": "How to cook jelly",
            "actionType": "web",
            "data": "https://red.to"
        },
        {
            "title": "How to cook pasta",
            "actionType": "web",
            "data": "https://red.to"
        },
        {
            "title": "Pasta FAQ's",
            "actionType": "navigation",
            "data": [
                {
                    "title": "Row 1",
                    "actionType": "web",
                    "data": "https://red.to"
                },
                {
                    "title": "Row 2",
                    "actionType": "web",
                    "data": "https://red.to"
                },
                {
                    "title": "Row 3",
                    "actionType": "web",
                    "data": "https://red.to"
                }
            ]
        },
        {
            "title": "How to buy pans",
            "actionType": "web",
            "data": "https://red.to"
        }
    ]
}
```

Each section is made up of 3 values; `title`, `actionType` and `data`.

`title` is pretty straight forward, it’s the title.

The `actionType` defines what type of controller should be shown. `navigation` will show a table view and `web` will show a web view.

`navigation` action types expect the `data` value to be an array of sections.

`web` action types expect the `data` value to be a URL.

## License

[MIT License](http://www.opensource.org/licenses/MIT).
