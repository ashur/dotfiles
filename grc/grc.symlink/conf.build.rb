# messages
regexp=^#.*#$
colours=green
.........
# xcode messages
regexp=^===.*===$
colours=green
.........
# 
regexp=\b(gcc|clang|llvm-gcc-4.2)\b
colours=yellow
count=more
.........
# Xcode commands
regexp=\b(CompileC|Analyze|PhaseScriptExecution|ProcessProductPackaging|CodeSign|CopyPNGFile|CopyStringsFile|CompileXIB|CpResource).*\b
colours=bold blue
.........
# 
regexp=^[^:\s]*?:\d+:
colours=bold magenta
.........
regexp=^[^:\s]*?:
colours=blue
count=once
.........
# 
regexp=\`[A-Za-z0-9_():&*]+( const)?\'
colours=magenta
.........
# -O
regexp=\-O\d 
colours=green
.........
# -o
regexp=\-o\s.+\b
colours=yellow
.........
# warning and error won't work, unless you redirect also
# stderr to grcat 
#
# warning
regexp=warning:.*
colours=white
.........
regexp=warning:
colours=bold yellow
count=once
.........
# error
regexp=error:.*
colours=bold white
.........
regexp=error:
colours=bold white on_red
count=once
.........
#note
regexp=note:
colours=bold cyan
count=once