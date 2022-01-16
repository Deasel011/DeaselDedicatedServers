$ip = curl ifconfig.me/ip
$addr = $ip.Content


### Google Domains provides an API to update a DNS "Syntheitc record". This script
### updates a record with the script-runner's public IP, as resolved using a DNS
### lookup.
###
### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273

$USERNAME=$env:gcloudusr
$PASSWORD=$env:gcloudpwd
$HOSTNAME=$env:gclouddomain

$pair = "$($USERNAME):$($PASSWORD)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

# Resolve current public IP
# IP=$( dig +short myip.opendns.com @resolver1.opendns.com )
# Update Google DNS Record
$URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${addr}"
echo $URL
Invoke-WebRequest -Uri $URL -Method POST -Headers $Headers