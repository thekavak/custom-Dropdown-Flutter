# custom_dropdown_example

How to open DropdownButton when other widget/button is tapped, in Flutter?

Example:

![](https://github.com/thekavak/custom-Dropdown-Flutter/blob/master/asset/example.gif)



## Getting Started


The easiest way to get what you want without changing the SDK, copy dropdown.dart and create your own version, let's call it DropdownButton.dart and paste the code there...

In 546, rename the class to CustomDropdownButton and on lines 660 and 663 _DropdownButtonState is treated as CustomDropState (show outside file var for down state class).

Now you can do whatever you want with it, even though you're interested in _handleTap() to open the overlay menu options.

Instead of making _handleTap() public, and refactor the code, add another method like:

void callTap() => _handleTap(); //Line 1111 in lib/Dropdownbutton.dart 

Then let's replace the dropdown we used with the one we just created and create a global key to control it.

Button Onpressed Method

 void _openDropdown() {
    CustomDropdownButtonState? state = dropdownKey.currentState;
    state!.callTap();
  }

You can find an example in the lib folder.

This example was created based on the share on stackoverflow.
For more please visit. https://stackoverflow.com/a/57530699/12317167


