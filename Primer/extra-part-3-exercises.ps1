# Extra Part 3 Exercises


# Open this file in the PowerShell ISE or Visual Studio Code.
# This file should be considered copyrighted material and part of the PowerShell Practice Primer book.


#region Exercise 1
<#
Create an array of the numbers 1 to 20 and then get the 5th element of the array.

Hint:
You may want to read help about arrays.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 2
<#
Initialize an empty array. Add 10 random numbers between 10 and 100.
Finally, get the sum total of all numbers in the array.

Hint:
You may want to get some help about arrays.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 3
<#
Create a hashtable with keys for your computer name, PowerShell version,
 and the current date (without the time). Don't use any hardcoded values.
  Save the hashtable to a variable.

Hint:
You might want to get some help about hashtables.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 4
<#
Using the hashtable from the previous exercise, add a key for Name
using the values of Bits and WinRM. Remove the Date and PowerShell version keys.
 Finally, splat the hashtable to Get-Service.

Hint:
You will be adding an array of values.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 5
<#
Create an ordered hashtable with keys for your computer name,
all the running processes, the top 5 processes using the most working set,
and the total size of your %TEMP% folder in bytes.
 Complete the exercise by creating a custom object from the hashtable.

Hint:
You'll need one-line pipelined expressions to get the values of some of these keys.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 6
<#
Recreate the hashtable from the previous exercise, but this time
 create a custom object at the same time.

Hint:
You will need a type accelerator.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 7
<#
Get all event logs on your computer that have entries and show the log name,
 maximum size, the total number of entries, and a property called Computername
 to reflect the computername.

Hint:
Run the initial command with your computername. You'll need need to select
the properties you want.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 8
<#
Recursively go through all files in %TEMP%, or a directory of your choice.
The result of your PowerShell expression should show the number of files per
file extension and their total size in bytes.

Hint:
You will want to process each group of extensions and selecting the properties to display.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 9
<#
Create an array of letters A through E. Get a random item from the array
 and assign it to $X. Then create a PowerShell construct that displays
 "alpha","bravo","charlie","delta","echo" based on the value of X.

Hint:
This will be easier to answer in the PowerShell ISE or VS Code. You may need to switch things up a bit.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 10
<#
Take the string "PowerShell Forever" and display the characters in alphabetic order.

Hint:
A string is an array of characters that you can join together any way you want.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 11
<#
Create a hashtable of services based on their startup type.

Hint:
You can create this with a cmdlet.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 12
<#
Using the hashtable you created in the previous exercise, get the display name of the last disabled service.

Hint:
You can use object.property notation to drill down.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 13
<#
Get all the even numbers between 1 and 50.

Hint:
You'll need to test each number with a modulo expression.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 14
<#
Starting with $i equal to 0, loop 5 times, each time incrementing $i by 5. At the end does $i equal 25?

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 15
<#
Display the top 25 processes that have been running the longest.
 Include the process ID, process name, start time, how long it has been running and path.

Hint:
Not every process has a start time so you'll need to filter those out.
Not every process will have a path and you can calculate a runtime by subtracting dates.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 16
<#
Get 25 random numbers between 10 and 100. Multiply each one by 3
then get the total sum of these numbers, their average, the largest number and the smallest.

Hint:
Get your random numbers from a range.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 17
<#
Create these aliases: np (notepad.exe), tx (tzutil.exe), ct (control.exe).
Export them to a json file. Delete the new aliases and recreate them from the json file.

Hint:
There are no alias specific commands for removing so you'll have to find another way.
And there is a quirk with converting from json in Windows PowerShell. Convert first,
and then recreate the aliases in a separate command. You can simplify the process
by only exporting the data you need and in the right format.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 18
<#
Find all files in %TEMP%, or a folder of your choice, that are either less than
100 bytes or greater than 1 megabyte.

Hint:
You can create a compound filter.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 19
<#
Take the output from the previous exercise and save it as a standard XML file
in UTF-8 format. The filename should be in %TEMP% and include a datetime
like YearMonthDay and the computername.

Hint:
This is not using the clixml cmdlets. Get-Date can give you the file date you need.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 20
<#
Using Invoke-RestMethod, get the latest RSS entries from
https://jdhitsolutions.com/blog/feed and display the title, link, and
when it was published, as a date time value, in a grid view.

For bonus points, see if you can include a comma separated list of category names.

Hint:
You'll need to treat something AS something else. Properties with special characters need to be quoted.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 21
<#
Using the previous solution as a starting point, select a single entry
from Out-Gridview and open the link in your web browser.

Hint:
In Windows 10 you should be able to start a url on an individual basis.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 22
<#
Get a unique list of commands run from your command history.
Bonus points if you can filter out any help commands.

Hint:
You may need to run some commands to build up history. Uniqueness is case sensitive.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 23
<#
Using the DNSClientCache cmdlet, export all records other than AAAA to a CSV file.
Your export should include the computername, the entry, its type, the time to live,
and its data. Instead of a comma, use a semicolon as the separator.

Hint:
You can specify the local computername and filtering early is always best.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 24
<#
Using your birthday, write an object to the pipeline that shows
your birthday (and time if you know or want to make something up),
your current age in years as a round number, the timespan you've been alive,
the day of the week you were born, and what day you can retire at age 65.
Other than your birthday, you should be able to calculate everything.

Hint:
You should be able to let PowerShell handle any culture specific date time formatting.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 25
<#
Assuming you have a few third party applications or utilities running,
 prepare a formatted report of all processes that are not from Microsoft
 and copy to the clipboard.  Paste into Notepad to verify.

Hint:
Not all processes have a company name defined. You can only copy
strings to the clipboard. Group-Object is not part of the solution.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


