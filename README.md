# RubyConf 2017 Credit Quine

* [rubyconf-credits.rb](rubyconf-credits.rb): The program
* [Demo movie](https://www.youtube.com/watch?v=ABuj0XfltpM)

This program plays music by spawning `aplay` command and writing RIFF WAVE sound data into the process.
If `aplay` is available, just run it:

    $ ruby rubyconf-credits.rb

If `aplay` is not avaiable in your platform, try the following command:

    $ ruby rubyconf-credits.rb "mplayer -cache 1024 -"

The first argument must be a command line that accepts and plays RIFF WAVE data read from stdin.
