# openmeta.rb

* https://github.com/zhaocai/openmeta.rb


## DESCRIPTION:

openMeta in Ruby (MacRuby, more exactly!). This gem ports [openMeta][openmeta] api to macruby using framework.


## INSTALLATION:

* `[sudo] macgem install openmeta.rb`


## KNOWN ISSUE:

### 1. Macruby Slow Startup

This is a [known commnon issue of macruby]( https://github.com/MacRuby/MacRuby/wiki/Common-Issues ). 
One thing recommended is to add `VM_OPT_LEVEL=0` in front of the command line like 

```bash
alias tag='VM_OPT_LEVEL=0 /usr/local/bin/tag'
```

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

