# simple if

if [ condition ]; then
  commands
fi

# if else

if [ condition ]; then
  commands
else
  commands
fi


# else if

if [ condition1 ]; then
  commands
elif [ condition2 ]; then
  commands
elif [ condition3 ]; then
  commands
else
  commands
fi

#!/bin/bash

# ======================================
# Bash IF Condition Syntax + Examples
# ======================================

###################################
# 1️⃣ Simple IF
###################################
a=10
if [ $a -gt 5 ]; then
  echo "Simple IF: a is greater than 5"
fi


###################################
# 2️⃣ IF - ELSE
###################################
b=3
if [ $b -eq 10 ]; then
  echo "IF ELSE: b equals 10"
else
  echo "IF ELSE: b is not equal to 10"
fi


###################################
# 3️⃣ IF - ELIF - ELSE
###################################
c=8
if [ $c -lt 5 ]; then
  echo "ELIF: c < 5"
elif [ $c -ge 5 ] && [ $c -lt 10 ]; then
  echo "ELIF: c is between 5 and 9"
else
  echo "ELIF: c >= 10"
fi


###################################
# 4️⃣ String Check
###################################
name="Kiran"
if [ "$name" = "Kiran" ]; then
  echo "STRING: Name matched!"
fi


###################################
# 5️⃣ File Check
###################################
file="/etc/passwd"
if [ -f "$file" ]; then
  echo "FILE: File exists"
else
  echo "FILE: File not found"
fi
