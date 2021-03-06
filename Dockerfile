FROM debian:stable-slim
RUN apt-get update -y
RUN apt-get install -y wget git apt-utils
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
RUN apt-get install -f ./packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update -y
RUN apt-get install -y powershell
RUN pwsh -c 'Set-PSRepository -Name "PSGallery"  -InstallationPolicy Trusted'
RUN pwsh -c "Install-Module -Name VMware.PowerCLI"
COPY scripts /scripts
COPY scripts/pwsh-profile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1
ENTRYPOINT [ "/bin/bash", "/scripts/init.sh" ]
