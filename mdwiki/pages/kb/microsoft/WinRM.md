# WinRM

## Run the following command to enable WinRM with default configuration values

```c:\> winrm quickconfig```

## Check if a listener is running, and verify the default ports

```c:\> winrm e winrm/config/listener```

The default ports are 5985 for HTTP, and 5986 for HTTPS.

## Enable basic authentication

1. Run the following command to check whether basic authentication is allowed

    ```c:\> winrm get winrm/config/service```

2. Run the following command to enable basic authentication

    ```c:\> winrm set winrm/config/service/auth @{Basic="true"}```

## Allow transfer of unencrypted data

    ```c:\> winrm set winrm/config/service @{AllowUnencrypted="true"}```

## Change channel binding token hardening level to relaxed

```c:\> winrm set winrm/config/service/auth @{CbtHardeningLevel="relaxed"}```

## Enable basic authentication on the WinRM client

1. Run the following command to check whether basic authentication is allowed.

    ```c:\> winrm get winrm/config/client```

2. Run the following command to enable basic authentication.

    ```c:\> winrm set winrm/config/client/auth @{Basic="true"}```

3. Run the following command to allow transfer of unencrypted data on the WinRM client.

    ```c:\> winrm set winrm/config/client @{AllowUnencrypted="true"}```

## If the WinRM host is in an external domain, run the following command to specify the trusted hosts

```c:\> winrm set winrm/config/client @{TrustedHosts="host1, host2, host3"}```

## Run the following command to test the connection to the WinRM service

```c:\> winrm identify -r:http://winrm_server:5985 -auth:basic -u:user_name -p:password -encoding:utf-8```

## Restart WinRM service

```c:\> net stop WinRM && net start WinRM```
