# 500px-osx-background
Easily set your Mac background to a random image on 500px website

### Description ###

This script allows you to dynamically change your macOS background, taking images from [500px](https://500px.com).

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

 5. Now you have to append the following line (press `i` button to insert data):

    ```
    00 12 * * * sh /directory_path/500px-osx-background.sh
    ```

    where `/directory_path/` identifies the path of the directory containing the script (to be configured as value of the `$DIR` directory on the script), while `00 12` specifies the program has to be called every day at noon.
 6. Hit `:q` to close, saving the file
 7. Enjoy!

### Notes ###

In order to immediately set the new background, the `Dock` program has to be killed.
If you don't want to kill it, you can comment the relative line on the script.

It's also available a [Reddit version](https://github.com/auino/reddit-macos-background) of this program, with support to [Gnome](https://www.gnome.org) based Linux systems.

### External contributions ###

 * Thanks to [theiwaz](https://github.com/theiwaz) for his suggestions on multi monitor support
 * Thanks to [miladkdz](https://github.com/miladkdz) for his suggestions on macOS Sierra support

### Contacts ###

You can find me on Twitter as [@auino](https://twitter.com/auino).
