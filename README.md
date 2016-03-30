# Girder Plugin Development Sandbox

## Getting Started

Edit config.rb to configure your plugin:

    GIRDER_PLUGIN = {
      title: "Item Previews",                           # A human readable title
      girder_folder_name: "item_previews",              # The plugin folder, as in girder/plugins/{girder_folder_name}
      local_files_dir: "../girder-item-previews"        # Path to the plugin's files (relative to this Vagrantfile)
    }

Then simply:

    vagrant up

---

Girder is now installed in a virtual machine and available by visiting 
http://localhost:8080.

Edit the files in your `local_files_dir` and see your changes live.


## Restarting Grunt

The virtual machine will automatically be watching for changes to your plugin 
direcotry on provisioning, but if you need to manage the Grunt watch task:

    vagrant ssh
    sudo su
    watch_kill      # kills any Grunt watches
    watch_start     # restarts the Grunt watch
    watch_log       # tail the Grunt watch logs, useful for debugging

## Virtual Machine restarts

As you halt/restart the virtual machine, you may need to restart the 
Girder server and watch commands upon subsequent calls on `vagrant up`:

    vagrant ssh
    sudo su
    watch_start     # restarts the Grunt watch
    python -m girder# restarts the Girder server
