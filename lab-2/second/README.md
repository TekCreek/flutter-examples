# basic_widget_example

1. First create a new flutter project using the following command 

    ```
        flutter create lab_2b 
    ```

2. You will see the standard folder structure and basic files created for you.

Replace the content of lib\main.dart with the one from this lib folder one at a time.

Note - This is an optional step you can directly use `flutter run` command.
3. You can use flutter build to build the project 

    Use the below command for android project.
    ```
        flutter build apk 
    ```
    Use the below command for web project
    ```
        flutter build web
    ```

4. You can use flutter run command

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