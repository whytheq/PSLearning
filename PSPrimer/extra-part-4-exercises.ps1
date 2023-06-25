# Extra Part 4 Exercises


# Open this file in the PowerShell ISE or Visual Studio Code.
# This file should be considered copyrighted material and part of the PowerShell Practice Primer book.


#region Exercise 1
<#
Display all classes in the root\cimv2 namespace that start with 'win32_'

Hint:
The CIM cmdlets include one specific to this task.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 2
<#
What are the methods of the Win32_LogicalDisk class?

Hint:
You may need to use Get-Member to discover what to use.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 3
<#
List all of properties and current values of the WMI class for the operating system.

Hint:
Once you find the class, it should be simple to select all the properties to display.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 4
<#
Using WMI, list all services that are set to start automatically but are not running.
Show the display name only.

Hint:
Don't assume that property names are the same as Get-Service.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 5
<#
Using WMI, write an object to the pipeline that shows the computer name,
when it last started, and how long it has been up and running.

Hint:
You'll need to calculate a timespan. This is easiest when using the CIM cmdlets.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 6
<#
Get memory information from your computer that shows how much
total physical memory and virtual memory is available, and how much
free of each. Don't forget to include the computer name.

Hint:
The operating system needs to know this information.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 7
<#
Using the solution from the previous exercise, revise it to display
memory values in GB and calculate a percentage free of physical and virtual memory.

Hint:
Memory values are in KB.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 8
<#
Create a formatted table that shows all running services, the account
hey are running under, and their display name, service name, and start mode.
Group the results by the account name and sorted by the display name.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 9
<#
PowerShell includes a number of cmdlets that are based on CIM.
Find something that can get you volume information for Drive C and
show the volume name, size and free space in GB.

Hint:
Don't assume that what you see are the actual property names.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 10
<#
Get information about the installed antivirus product on your computer.

Hint:
You are going to have to find the correct security namespace. The class name should be obvious.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 11
<#
Using WMI, get a list of event log files that shows the log name,
the path to the log file, when it was last modified, the number of entries,
the size of the log, and what percentage of the log is in use.

Hint:
You will need to compare the file size to its maximum size.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 12
<#
List the user accounts in the local administrator group.

Hint:
You will need to find all win32_useraccounts associated with the group.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 13
<#
Using the previous solution as a starting point, list all users and groups
that are members in the local administrators group.
You may need to create an empty test group and manually add it.

Hint:
Get-CimAssociatedInstance won't let you specify more than 1 resultant class.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 14
<#
Find all cmdlets and functions that accept CIMSession as a parameter.

Hint:
Cmdlets and functions are different types of commands.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 15
<#
Get partition details for drive C that includes its partition number, size in GB and its type.

Hint:
Look for a command instead of inventing your own.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 16
<#
Create several CIM sessions to your local computer, or remote
test computers if you have them. Using the sessions get information about installed processors.

Hint:
Take advantage of the PowerShell pipeline.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 17
<#
Using your CIM sessions from the previous exercise, create a report that
shows the computer name,drive letter, drive label, size, free space (in GB).
and percent free for all fixed drives.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 18
<#
Using your previous solution, create an HTML report with data
formatted as a table. Include a title and header. View your file in a browser.

Hint:
You can use HTML tags like <H1> in your content.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 19
<#
Query WMI to get a list of all processes, excluding System and System Idle Process,
 and display the ID, name, command line, executable path, working set size, creation date, and owner.

Hint:
You'll need to use a compound legacy filter to eliminate items that don't match.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 20
<#
Create a report for each network adapter that is currently up.
The report should show the adapter name, a description, link speed,
MAC, and IPv4 address.

Hint:
You can do this in a one-line command, although you'll have to use a
nested expression to get the IP address.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 21
<#
List all installed products that have a name defined. Select the name, vendor,
a description, and when the product was installed. Bonus points if you can
convert the date value to a [datetime].

Hint:
You can use a wildcard filter to see if the name has a value.  The WMI wildcard is %.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 22
<#
This is a multi-step exercise. Using WMI, create a new environment variable
for yourself called PSPrimer with a value of 1.0. Verify you created it.
Next set the value to 2.0 and verify. Finally, delete the variable.

Hint:
You will need to set several properties for your new instance.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 23
<#
Create an html report of all environment variables grouped by user name.
Ideally, the report will have the user name in a tag like <H2>
followed by a table showing the variable name and value.

Hint:
You can do this is with 2-3 lines of PowerShell. You will have to use html
fragments and need to account for the angle brackets around System.
You will need to remove them. Your final HTML doesn't need a body.
Your fragments can be post-content.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 24
<#
WMI has a large number of performance counters. Find the one that
provides formatted results of operating system performance and display all
of the file related properties, the processor queue length and system uptime.
Bonus points if you can turn the uptime into something more meaningful.
Extra bonus points if you can do this for multiple machines using splatting.

Hint:
You are looking for a System related class. The uptime value is in seconds.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 25
<#
There are multiple TCPIP performance counter classes.
Get performance counter data for all of them and display the results
a list grouped by each counter class name.

As your last bonus, come up with a variation that writes an object to the
 pipeline which includes the counter class.
 This should be something you could export to XML or JSON

Hint:
You can pipe class names to Get-Ciminstance.
But you'll have to extract the class name for sorting and grouping.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


