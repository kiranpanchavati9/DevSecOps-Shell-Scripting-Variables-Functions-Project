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
# ==========================
# Bash Conditions Reference
# ==========================

# Conditions are used everywhere in scripts:
# 1️⃣ String Check
# 2️⃣ Number Check
# 3️⃣ File Check


#######################################
# 1️⃣ STRING CONDITION CHECKS
#######################################

# [ "$str1" = "$str2" ]    → True if strings are equal
# [ "$str1" != "$str2" ]   → True if strings are NOT equal

# [ -z "$str" ]            → True if string is EMPTY (zero length)
# [ -n "$str" ]            → True if string is NOT EMPTY

# Example:
name="Kiran"
if [ "$name" = "Kiran" ]; then
  echo "Name matched!"
fi


#######################################
# 2️⃣ NUMBER CONDITION CHECKS
#######################################

# [ num1 -eq num2 ]   → Equal
# [ num1 -ne num2 ]   → Not equal
# [ num1 -gt num2 ]   → Greater than
# [ num1 -lt num2 ]   → Less than
# [ num1 -ge num2 ]   → Greater than or equal
# [ num1 -le num2 ]   → Less than or equal

# Example:
a=10
if [ $a -gt 5 ]; then
  echo "a is greater than 5"
fi


#######################################
# 3️⃣ FILE CONDITION CHECKS
#######################################

# [ -e file ]   → True if file exists (file or directory)
# [ -f file ]   → True if it is a regular file
# [ -d dir ]    → True if directory exists
# [ -r file ]   → True if readable
# [ -w file ]   → True if writable
# [ -x file ]   → True if executable

# Example:
file="/etc/passwd"
if [ -f "$file" ]; then
  echo "File exists"
else
  echo "File not found"
fi


#######################################
# 👍 Important Notes
#######################################

# ❗ Space required after [ and before ]
# Correct: if [ $a -gt 5 ]; then
# Wrong:  if [$a -gt 5]; then

# Always quote strings → "$var"
# Use && and || for multiple conditions


