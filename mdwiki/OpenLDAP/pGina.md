# Windows LDAP auth with pGina

O Windows tem o recurso de usar o OpenLDAP para logins de máquinas. No entanto, para utilizar o recurso, você precisa instalar e executar o pGina.

Uma biblioteca de vínculo dinâmico (DLL) de Identificação e Autenticação Gráfica. O GINA é um componente DLL substituível carregado pelo executável do Winlogon. A GINA implementa a política de autenticação do modelo de logon interativo e espera-se que execute todas as interações de identificação e autenticação do usuário.

1. Install pGina

    Download and run the [pGina installer](https://github.com/pgina/pgina/releases/). pGina requires that the Visual C++ redistributable package and .NET Framework 4.0 be installed in order to function correctly. The installer will give you the option of installing this package, be sure to select that option if you haven't already installed it.

    After installation, pGina will be configured with the "LocalMachine" plugin enabled for the authentication and gateway stages (see below). This means that you will be able to use pGina to log into the machine using existing local accounts without any prior setup. If necessary, the LocalMachine plugin will create accounts for authenticated users after logging in.

2. Configure Plugins

    After installation, start the pGina configuration application. Verify that the pGina service is running and that the Credential Provider/GINA is installed and enabled. These components much be enabled for pGina to function properly.

    ![](/OpenLDAP/img/image1.png)

    Next, select these 6 checkboxes to set up LDAP authentication.

    ![](/OpenLDAP/img/image2.png)

    Then, order the LDAP plugin before the Local Machine plugin so LDAP groups can be added to Local Machine groups during login.

    ![](/OpenLDAP/img/image3.png)

3. Configure LDAP

    First, configure LDAP Authentication. Enter your Foxpass binder DN and password. If you don't have a Foxpass binder, create one here.

    ![](/OpenLDAP/img/image4.png)

    Next, change the LDAP authorization settings to manage access. The default rule is "Allow," but you can add rules that use group membership to determine access.

    ![](/OpenLDAP/img/image5.png)

    Finally, you can use the "Gateway" tab to automatically add members of LDAP groups to local groups.

    ![](/OpenLDAP/img/image6.png)

4. Verify the Configuration

    Configure your LocalMachine plugin like so:

    ![](/OpenLDAP/img/image7.png)

    Go to the "Simulation" tab and test the configuration using your OpenLDAP credentials. If the connection is successful, you should get the 3 green checks as pictured below. The "Local Groups" section at the bottom lists the groups that the user is recognized as being a member of when they log in.

    ![](/OpenLDAP/img/image8.png)

    Now you're good to start using OpenLDAP authentication to log into Windows machines!
