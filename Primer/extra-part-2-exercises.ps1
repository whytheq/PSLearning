# Extra Part 2 Exercises


# Open this file in the PowerShell ISE or Visual Studio Code.
# This file should be considered copyrighted material and part of the PowerShell Practice Primer book.


#region Exercise 1
<#
Assuming you haven't modified your PowerShell session with a profile script,
what are the default PSDrives for the Registry provider?

Hint:
You could get PSProvider information or PSDrives.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 2
<#
How many certificates are installed in the root certificate store for the local machine?

Hint:
You can treat certificates like files.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 3
<#
Query the local registry to display the registered owner and organization.

Hint:
You might want to find the correct keys using regedit.exe

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 4
<#
How many functions are defined in your current PowerShell session?

Hint:
You can list functions just like files.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 5
<#
List all applications installed under the Uninstall section of the registry.
Give yourself a challenge and filter out those with a GUID for a name.

Hint:
Use regedit.exe to find the correct path.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 6
<#
Modify the registered organization value in the registry. Verify the change.
Then go ahead and change it back to the original value.

Hint:
Save the current value to a variable.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 7
<#
What PSProvider supports transactions?

Hint:
You should know how to find provider details by now.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 8
<#
How would you find code signing certificates installed on your computer?

Hint:
Some cmdlet help is provider aware.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 9
<#
Turn %PATH% into a list of directories.

Hint:
You will need to split an environmental variable.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 10
<#
Create a new registry key under HKEY_CURRENT_USER called 'PowerShell Training'.
Then create values under it for your name, computername, the current date and
PowerShell version. You should be able to get all of these values from PowerShell.

Hint:
Remember that registry keys are items and values are item properties.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 11
<#
Using PowerShell, delete the PowerShell Training registry setting you created in the previous exercise.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 12
<#
Create a PSDrive called Download for the Downloads directory under your user directory.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 13
<#
Get all functions that don't support cmdletbinding.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 14
<#
Get the default WSMan port values.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 15
<#
Set the Digest Authentication setting for WSMan to $False.
If it is already False then set it to True. Revert the change if you need to.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 16
<#
Create a new environmental variable in PowerShell called Pictures that
points to your Pictures folder. Does this setting persist?

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 17
<#
Make a persistent environmental variable called Pictures that points
to your Pictures folder. Verify it in PowerShell.

Hint:
You can define environment settings in the registry for just you.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 18
<#
Create a backup copy of your user environmental variables found in the registry to EnvBackup

Hint:
You cannot copy items across providers so stick to the current location.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 19
<#
Delete the persistent Pictures environmental variable you created earlier
and recreate it using %USERPROFILE% as an expandable variable.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 20
<#
Export your user specific persistent environment settings to a CSV file that you can use outside of PowerShell.

Hint:
You don't need any type information or PowerShell specific values.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 21
<#
List all certificates that have expired showing the certificate's friendly name, when it expired, the issuer and path

Hint:
There is provider specific help that will assist you.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 22
<#
Create a hashtable of all your PSDrives grouped on the provider name.

Hint:
The provider property is a nested object.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 23
<#
Create the folder structure a\b\c\d\e\f under your %TEMP% directory.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 24
<#
Create the file data.txt in the folder %temp%\foo\bar\xyz.

Hint:
You should know how to create new items by now.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


#region Exercise 25
<#
Using transactions, create the registry key PSPrimer\Data under
HKEY_LOCAL_MACHINE\Software. Create a string setting called 'version'
with a value of 1. Create a dword setting called 'random' with a value of a random
number between 10 and 99. Create a value called 'free' with the amount of free
space on your C drive. If you are using PowerShell 7, create the registry items without
using transactions.

Hint:
You may need to read about transactions. You can get free space with Get-PSDrive.
The solution will be at least 5 lines of PowerShell.

#>
<#
 Work Area and Notes





#>

#region Your Solution






#endregion

#endregion


