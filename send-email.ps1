# Author: Michael Migsch
# Description: Sending an email with by calling Send-Mail from your gmail account.
# Version: 1.0
# Params: -To <string>
#         -Subject <string>
#         - Body <string>
# Readme: You need to allow less secure apps in your gmail security settings for the script to work.

function Send-Email {

    param(
        [parameter(Mandatory)][String]$To,
        [Parameter(Mandatory)][String]$Subject,
        [Parameter(Mandatory)][String]$Body
    )

    # Get user credentials
    $Username = (get-content -Path D:\Dokumente\cred.txt)[0]
    $Password = (get-content -Path D:\Dokumente\cred.txt)[1] | ConvertTo-SecureString -AsPlainText -Force

    # Params for Send-MailMessage
    $Email = @{
        SmtpServer = 'smtp.gmail.com'
        UseSSL = $true
        Verbose = $true
        Credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $Password
        From = $Username
        To = $To
        Subject = $Subject
        Body = $Body
    }

    Send-MailMessage @Email
}

