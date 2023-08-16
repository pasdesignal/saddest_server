# Scenario 2. "justneedspace": dude, where did I park my disk?

## Description

A custom service is trying to start but fails with error "not enough disk". 
Start the service sucessfully.

## Test

The systemd service justneedspace.service starts sucessfully:
systemctl start justneedspace

## Clues

<b>1.</b> You can use <i>ps</i> to list all processes and see if you see something related, for example with: <kbd>ps auxf</kbd>. Ignore system processes [in brackets].<br><br>
A better way is to use the command to list open files: <kbd>lsof</kbd>.<br><br>

<b>2.</b> Find the name (first column) and Process ID (PID, second column) of the process related to <i>/var/log/bad.log</i> by running <i>lsof</i> and filtering the rows to the one(s) containing <i>bad.log</i>.<br><br>You can also use the "fuser" command to quickly find the offending process: <kbd>fuser /var/log/bad.log</kbd>.<br><br>

<b>3.</b> Run: <kbd>lsof |grep bad.log</kbd> and get the PID (second column).<br><br> With the PID of the process, it's not necessary but we can find its current working directory (program location) by doing <kbd>pwdx PID</kbd> or for more detail: <kbd>lsof -p PID</kbd> and check the <i>cwd</i> row. This will allow us to check its ownership and perhaps inspect its offending code if it's a script (not a binary).<br><br>(Open window once more to see the complete solution).<br><br>

<b>4. Solution:</b> Using the PID found, terminate (kill) the process with <kbd>kill -9 PID</kbd>.
