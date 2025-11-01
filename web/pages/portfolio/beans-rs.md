Rewrite of the [beans](https://github.com/int-72h/ofinstaller-beans) installer for [Open Fortress](https://openfortress.fun) in [Rust](https://rustlang.org).

Brings many improvements to stability, performance, and doesn't get blocked by Windows Defender (since the old version used `pyinstaller`). It also has lower memory/CPU overhead when compared
to the original installer, and only depends on glibc on Linux.

Also includes a GUI written with FLTK for it's dialog system, but not a fully fledged one since this will get replaced by [Adastral](https://github.com/AdastralGroup) at some point.