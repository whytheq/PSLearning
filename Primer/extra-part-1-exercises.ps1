# Extra Part 1 Exercises


# Open this file in the PowerShell ISE or Visual Studio Code.
# This file should be considered copyrighted material and part of the PowerShell Practice Primer book.


#region Exercise 1
<#
Get all services where the display name begins with 'Windows'.

Hint:
Service objects have several *name* properties.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 2
<#
Get a list of all classic event logs on your computer.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 3
<#
Find and display all of the commands on your computer that start with 'Remove'.

Hint:
Remember that cmdlets have a Verb-Noun naming convention.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 4
<#
What PowerShell command would you use to reboot one or more remote computers?

Hint:
Think about what standard PowerShell verb might be used in the command.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 5
<#
How would you display all available modules installed on your computer?

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 6
<#
How would you restart the BITS service on your computer and see the result?

Hint:
Not all commands write to the pipeline by default.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 7
<#
List all the files in the %TEMP% directory and all subdirectories.

Hint:
You can get values from the ENV PSDrive like this: $env:name

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 8
<#
Display the access control list (ACL) for Notepad.exe.

Hint:
You might consider displaying it as a list to make it easier to read.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 9
<#
How could you learn more about regular expressions in PowerShell?

Hint:
There is more to PowerShell help than cmdlet help.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 10
<#
Get the last 10 error entries from the System event log on your computer.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 11
<#
Show all of the 'get' commands in the PSReadline module.

Hint:
The focus is on the commands not the module.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 12
<#
Display the installed version of PowerShell.

Hint:
There isn't a cmdlet that you can run.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 13
<#
How would you start a new instance of Windows PowerShell without loading any profile scripts?

Hint:
You need to know the PowerShell executable name.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 14
<#
How many aliases are defined in your current PowerShell session?

Hint:
You will want to measure some objects.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 15
<#
List all processes on your computer that have a working set size greater than
or equal to 50MB and sort by working set size in descending order.

Hint:
Break this down into separate steps.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 16
<#
List all files in %TEMP% that were modified in the last 24 hours and display
 the full file name, its size and the time it was last modified.
 Write a PowerShell expression that doesn't rely on hard coded values.

Hint:
You might find this easier to do in several steps, such as first calculating the datetime value.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 17
<#
Get all files in your Documents folder that are at least 1MB in size and older than 90 days.
Export the full file name, size, creation date and last modified date to a CSV file.
You may have to adjust the exercise based on files you have available.

Hint:
Don't feel you need to do this as one line command. Break this into steps.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 18
<#
Using files in your %TEMP% folder display the total number of each files by their extension in descending order.

Hint:
You will need to group your results and remember that objects can change in the pipeline.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 19
<#
Create an XML file of all processes running under your credentials.

Hint:
Export filtered objects to an XML file that you could re-import into PowerShell.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 20
<#
Using the XML file you created in the previous question, import the XML data into
your PowerShell session and produce a formatted table report with processes
grouped by the associated company name.

Hint:
Get-Member is your friend.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 21
<#
Get 10 random numbers between 1 and 50 and multiply each number by itself.

Hint:
You'll have to do something for a certain number of times.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 22
<#
Get a the list of event logs on the local computer and create an HTML file
that includes 'Computername' as a heading. You can decide if you want to
rename other headings to match the original cmdlet output once you have a solution working.

Hint:
You'll need to reverse-engineer property names and be specific about what you
want to convert. You'll also need to re-calculate the entry count.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 23
<#
Get modules in the PowerShell Gallery that are related to teaching.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 24
<#
Get all running services on the local machine and export the data to a json file.
Omit the required and dependent services. Verify by re-importing the json file.

Hint:
You will need to exclude when you select properties.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 25
<#
Test the local computer to see if port 80 is open.

Hint:
If you think about it, port 80 is related to a network connection.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


