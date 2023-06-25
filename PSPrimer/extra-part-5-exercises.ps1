# Extra Part 5 Exercises


# Open this file in the PowerShell ISE or Visual Studio Code.
# This file should be considered copyrighted material and part of the PowerShell Practice Primer book.


#region Exercise 1
<#
Using the ternary operator, write a PowerShell expression that if the day of the week is
Monday, Wednesday, or Friday to run Get-Service, otherwise run Get-Process.

Hint:
You might need to read some help.,

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 2
<#
Get the last 1000 entries from the System event log from 10 computers.
Use your local computer name ten times.

Hint:
You need to do something for each computer as quickly as possible.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 3
<#
Create a simple pipeline chain that if Notepad is running, kills the Notepad process and
then creates a text file with content that includes the current date that you killed the process.
 Also, suppress the error message if Notepad is not running.

Hint:
You will need to chain some commands together in the pipeline.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 4
<#
Get about help topics grouped by the first letter of the topic name, after about_ .
The grouped output should be sorted alphabetically. Then export to a file and re-import
into PowerShell. You should be able to run a command like $about.P and see the topics
that begin with P. Don't export the help content, just the name.

Hint:
You might need to normalize the first letter for proper grouping.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 5
<#
Create a formatted report that shows PowerShell experimental features.
The report should show if the feature is enabled and the description.
 Create the report so that you can read the entire description.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 6
<#
Using your solution from the previous problem, revise the output to use
ANSI formatting to show the name with a reversed background and if the
feature is enabled, to show the Enabled value in Green. You might need to
 enable a feature to test. Or, show disabled features in red.

Hint:
PSReadline options can point you in the right direction. It might be easier to
construct your answer in VSCode and test in the console.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 7
<#
Get all local user accounts and export to a CSV file. The export should include
type information and add quotes to the Description column.  Do not overwrite existing files.
Verify by re-importing the CSV file. Give yourself an extra challenge by using splatting.
You should be able to get account information without using WMI/CIM.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 8
<#
Using the REST API described at [https://github.com/chubin/wttr.in](https://github.com/chubin/wttr.in),
 get the current weather information for your location in JSON format.
 You can use a URI like https://wttr.in/Chicago?format=j1. Using the JSON data,
 create a formatted table showing the temperature, feels like temperature, humidity,
 description, and wind speed. Use a table grouping that will show the location and
 the time of the weather observation. Convert the time to a datetime value.

 Give yourself an extra challenge and right-align the wind speed.
 Select temperature and speed formats appropriate to your region.

Hint:
You'll find this easier to break down into steps. Splatting might help tool.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 9
<#
First, find all markdown files in any module found in your module path.
Then view a random markdown file at the console.

Hint:
Markdown files have a .md extension.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 10
<#
Using your previous solution as a starting point, find files that don't have DSC
in the name and select them in a console grid view. Show each selected markdown
file in your web browser.

Hint:
You might need to install the Microsoft.PowerShell.ConsoleGuiTools module.
 Or use the tradtional gridview command. There are several ways to show markdown in case one way fails or is buggy.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


