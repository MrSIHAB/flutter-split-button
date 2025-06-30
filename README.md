<!-- TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them. -->

This package provides you the `material 3 expressive` `split button` for the
first time in flutter. This package includes same popup menu with a huge
customization options.

## Features

With a huge customizations, You can decide background and foreground color.
Leading, action, title. You can specify which value you want to use. What should
be the border radius and so on. Here is some visual images:

![button_closed](images/button_purple_closed.png)

## Getting started

Getting start with this button is that simple:

```dart
// parent
    child: SplitButton(
        title: Text("Hello World"),
        popupList: List<SplitButtonEntry<Int>>[
            SplitButtonEntry(
                value: 1, // Int 
                child: Text("Hello BD")
            ),
            // other list
            ...
        ]
    )
```

## Usage

Other options

```dart
return SplitButton(
  width: 200,
  leading: Icon(Icons.image),
  title: Text(city, style: TextStyle(fontSize: 16)),
  backgroundColor: bgColor,
  foregroundColor: fgColor,
  onChanged: (value) => log(value),
  popupList: locationList
      .map(
        (e) => SplitButtonEntry(
          value: city,
          child: ListTile(
            textColor: fgColor,
            iconColor: fgColor,
            leading: Icon(Icons.image),
            title: Text("${e.city},  ${e.country}"),
          ),
        ),
      )
      .toList(),
);
```

All option you'll get here:\

_Required Parameters :_

`title` : Any widget. Text widget is recommended.

`popupList`->`List<SplitButtonEntry<T>>`: The children those will be showed in
the popup section. Required Parameters:

- `value`-> `T`: value that you'll get with onChanged parameter
- `child`: Any widget you want to show.

_Optional parameters :_

`super.key?`: Key if you want to use.\

`backgroundColor?`: Background of button and popup menu container.\

`foregroundColor?`: Foreground of button and popup menu container.\

`onPressed?`: A void callback when user click on the title.\

`Leading?`: Button prefix widget.\

`action?`: Suffix Widget. Default is keyboard down key when closed and up when
opened. If you user your custom widget, you have to manually manage the opened
and closed icon.\

`outerRadius?`: Border radius of Full buttons corner. Default is
Radius.circular(30)\

`innerRadius?`: Border radius where dropdown and title widget connect.Default:
Radius.circular(7)\

`menuRadius?`: Border radius of popup menu. Default: Radius.circular(20)

`elevation?`: Button elevation

`enable?`: default value is true

`width?`: default is 200. Bigger width is recommended.

`spacing?`: Default: 2. Space between title and action gap.

`offset`: Default: `Offset(0, 0)`. Where the popup list should appear

`onChanged(value<T>)?`: You'll get the value what you set on the clicked popup
menu's value

`opOpened?`: Triggers when user opens the popup.

`onCanceled?`: Triggers when popup is closed without choosing an option

## Contribution

That isn't a complex package. Anyone with flutter knowledge can easily
contribute in the package to improve it. Contributions are what make the open
source community such an amazing place to learn, inspire, and create. Any
contributions you make are greatly appreciated. Don't forget to give star to
inspire us.

- Fork the repo
- Clone it to your physical machine.
- Create new branch(`git checkout -b feature/yourFeature`)
- apply changes and test it.
- Commit your Changes (`git commit -m 'add new feature'`)
- Push to the Branch (`git push origin feature/newFeature`)
- create a pull request
