# StSController

## General

Dirty fix for controller support in Slay The Spire for linux.

Tested for GOG version.

## Usage

You need java8 `javac` compiler and `zip`.

```
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
./patch.sh ~/games/slay_the_spire/
```

## Supported controllers

* Xbox One
* Logitech F310

## How to add your controller

Run patch.

Start game from terminal with plugged controller.

Find controller name in game log:

```
INFO controller.CInputHelper> CONTROLLER[0] Microsoft Xbox One X pad
```

Record keycodes for pressed keys:

```
INFO controller.CInputHelper> [BUTTON] keycode 4 pressed
```

Add section to `initializeIfAble()`:

```
} else if (controller.getName().contains("Controller name")) {
  model = com.megacrit.cardcrawl.helpers.controller.CInputHelper.ControllerModel.XBOX_ONE;
  ImageMaster.loadControllerImages(com.megacrit.cardcrawl.helpers.controller.CInputHelper.ControllerModel.XBOX_ONE);
  remapping.put(1, 0);
  …
}
```

`remapping.put(keycode_from_log, keycode_for_action)`

`ControllerModel` defines images used for controller buttons in ui.

Expected keycodes are:

```
select 0
cancel 1
topPanel 2
proceed 3
peek 8
pageLeftViewDeck 4
pageRightViewExhaust 5
map 6
settings 7
up -1000
down 1000
left -1001
right 1001
inspectUp -1002
inspectDown 1002
inspectLeft -1003
inspectRight 1003
altUp -2000
altDown 2000
altLeft -2001
altRight 2001
drawPile 1004
discardPile -1004
```

Run patch again.
