# messages
regexp=^#.*#$
colours=green
.........
# xcode messages
regexp=^===.*===$
colours=red
.........
# 
regexp=\b(gcc|clang|llvm-gcc-4.2)\b
colours=yellow
count=more
.........
# Xcode commands
regexp=\b(CompileC|Analyze|PhaseScriptExecution|ProcessProductPackaging|CodeSign|CopyPNGFile|CopyStringsFile|CompileXIB).*\b
colours=bold magenta
.........
# 
regexp=^[^:\s]*?:\d+:
colours=bold magenta
.........
regexp=^[^:\s]*?:
colours=cyan
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

