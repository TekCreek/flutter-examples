# 3.b) Implement media queries and breakpoints for responsiveness.
## MediaQuery 


1. First create a new flutter project using the following command 

    ```
        flutter create lab_3b 

        cd lab_3b
    ```

2. You will see the standard folder structure and basic files created for you.

        Replace the lib\main.dart with the one from this lib folder.

3. You can use flutter build to build the project 

    Use the below command for android project.
    ```
        flutter build apk 

    ```
    Use the below command for web project
    ```
        flutter build web
    ```

4. You can use flutter run command to launch the project 

    ```
        flutter run
    ```

   Emulator - launch the emulator and run the application in the emulator.
   Note - Applicable for VS Code, as a pre-requisite you need to 
   first create a virtual device through android virtual device manager.
   ``` 
        ctrl + shift + p
        Flutter: Launch Emulator 
        choose the device you created using AVD.
   ```

## Notes 

The MediaQuery class is a sort of more powerful version of LayoutBuilder because it’s alwaysavailable and it gives you more control over various settings of the screen. It just requires a context:

```dart

@override
Widget build(BuildContext context) {
    final width = MediaQuery.of(context)?.size.width ?? -1;
    return Text("$width");
}

```

With size you also have access to height, padding, distances and much more. For example, you might want to know what is the current orientation of the device:

```dart

    final orientation = MediaQuery.of(context)?.orientation;
    // Using a null check rather than providing a default value
    if ((orientation != null) && (orientation == Orientation.portrait)) {...}
    
```