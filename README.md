# openmeta.rb

* home  :: https://github.com/zhaocai/openmeta.rb
* rdoc  :: http://rubydoc.info/gems/openmeta.rb/
* code  :: https://github.com/zhaocai/openmeta.rb
* bugs  :: https://github.com/zhaocai/openmeta.rb/issues


## DESCRIPTION:

openMeta in Ruby (MacRuby, more exactly!). This gem ports [openmeta]( http://code.google.com/p/openmeta/ ) api to macruby using framework.


## INSTALLATION:

* `[sudo] macgem install openmeta.rb`



## COMMAND LINE INTERFACE:

### 1. Tasks (Subcommands):

      tag add                    # add openmeta tags, use ',' to separate multipl...
      tag clear                  # clear openmeta tags and rating
      tag clone -f, --from=FROM  # clone openmeta tags and rating
      tag get                    # get openmeta tags and rating
      tag help [TASK]            # Describe available tasks or one specific task
      tag rate                   # set openmeta rating
      tag recent                 # print recent tags
      tag remove                 # remove openmeta tags, use ',' to separate mult...
      tag set                    # set openmeta tags, use ',' to separate multipl...

### 2. Get Tags

      > tag help get
      get openmeta tags and rating
      Usage:
        tag get File

      Options:
        -f, [--format=FORMAT]  # print as yaml/plist

### 3. Set Tags

      > tag help set
      Usage:
        tag set --tag=TAG1,TAG2,TAG3 File

      Options:
        -t, [--tag=TAG]  # set tags, use ',' to separate multiple tags

### 4. Other Tasks:

      > tag help [TASK]

## KNOWN ISSUE:

### 1. Macruby Slow Startup

This is a [known commnon issue of macruby]( https://github.com/MacRuby/MacRuby/wiki/Common-Issues ). 
One thing recommended is to add `VM_OPT_LEVEL=0` in front of the command line like 

```bash
alias tag='VM_OPT_LEVEL=0 /usr/local/bin/tag'
```

In my environment, the startup time for the `tag` command is about 1 second.

## DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

## LICENSE:

Copyright (c) 2013 Zhao Cai <caizhaoff@gmail.com>

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.


[openmeta]: http://code.google.com/p/openmeta/

