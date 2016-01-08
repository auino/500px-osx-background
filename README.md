# 500px-osx-background
Easily set your Mac background to a random image on 500px

### Description ###

This script allows you to dynamically change your Mac (OS X) background, taking images from [500px](https://www.500px.com).

### Installation ###

 1. Clone the repository:

    ```
    git clone https://github.com/auino/500px-osx-background.git
    ```

 2. Configure the script, by opening it and setting configuration data as preferred
 3. Optionally, you can test the correct working of the script, by opening the Terminal app and running the following command:

    ```
    sh 500px-osx-background.sh
    ```

 4. Put the script on your crontab, by opening the Terminal app and running the following command:

    ```
    crontab -e
    ```

 5. Now you have to append the following line:

    ```
    00 12 * * * sh /directory_path/500px-osx-background.sh
    ```

    where `/directory_path/` identifies the path of the directory containing the script, while `00 12` specifies the program has to be called every day at noon.
 6. Hit `CTRL+X` to close, saving the file
 7. Enjoy!

### Notes ###

In order to immediately set the new background, the `Dock` program has to be killed.
If you don't want to kill it, you can comment the relative line on the script.

### Contacts ###

You can find me on Twitter as [@auino](https://twitter.com/auino).
