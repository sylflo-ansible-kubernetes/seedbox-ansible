Role Name
=========

This role will install a seedbox with the following tools:

- deluge
- heimdall
- jackett
- netdata
- plex
- radarr
- seafile
- sonarr

For more information see the chart https://github.com/sylflo/seedbox-chart/

Even tough most of the installation is automated you will have to configure by yourself those two softwares:

- plex
- seafile

Requirements
------------

You will need to have:

- a Kubernetes cluster
- Cert manager install to be able to set https (see cert-manager.io)
- To have persisent volume (Rook.io)

If you are looking for an Ansible role to provide all those tools see here https://github.com/sylflo/rancher2-ansible.

Role Variables
--------------

- validate_certs: true => Set to false if you do not have valid ssl for example if you use lets encrypt in staging
- validate_certs_rancher: false => Set to false if Rancher does not have a valid certificate

- domain_name: "seedbox_domain_name.com" => Domain name of the seedbox
- rancher_domain_name: "rancher_domain_name.com" => Domain name of Rancher
- rancher_admin_password: "rancher_password" => Admin password of Rancher
- rancher_cluster: "kimsufi" => Name of the cluster where to install the seedbox
- clusterissuer_name: "letsencrypt-prod" => ClusterIssuer name for cert-manager. It can also be letsencrypt-staging

- netdata_base64: "bmV0ZGF0YTokYXByMSRBRS5zNVo4UyRxU0d4UGV3YnFSMXI1REpTT3BXa3gvCg==" => Netadata basic auth in base64

- deluge_web_password: "deluge" => Password of Deluge

- jackett_url: "https://jackett.{{ domain_name }}"

- seafile_admin_email: "seafile@seafile" => Email of the Seafile's adminstrator
- seafile_admin_password: "seafile" => Password of the Seafile's adminstrator

- radarr_web_username: "radarr" => Username for Radarr
- radarr_web_password: "radarr" => Password for Radarr

- sonarr_web_username: "sonarr" => Username for Sonarr
- sonarr_web_password: "sonarr" => Password for Sonarr

- seedbox_chart_timezone: "Europe/Paris" => The timezone
- path_template_create_directory_in_filesystem_rook_volume: "../seedbox-ansible/templates/install_catalog/create_directory_in_filesystem_rook_volume.sh" => path to template
- path_template_append_force_http: "../seedbox-ansible/templates/heimdall/append_force_http.sh" => path to template

Example Playbook
----------------

    - name: Install seedbox
    hosts: all
    tasks:
        - include_role:
            name: '../../seedbox-ansible'
        vars:
            validate_certs: true
            validate_certs_rancher: false
            domain_name: "seedbox_domain.com"
            rancher_domain_name: "rancher_domain.com"
            rancher_admin_password: "rancher2_passowrd"
            rancher_cluster: "kimsufi"
            clusterissuer_name: "letsencrypt-prod"

            netdata_base64: "bmV0ZGF0YTokYXByMSRBRS5zNVo4UyRxU0d4UGV3YnFSMXI1REpTT3BXa3gvCg=="

            deluge_url: "deluge:8112"

            jackett_url: "https://jackett.{{ domain_name }}"

            seafile_admin_email: "seafile@seafile"
            seafile_admin_password: "seafile"

            radarr_web_username: "radarr"
            radarr_web_password: "radarr"

            sonarr_web_username: "sonarr"
            sonarr_web_password: "sonarr"

            rancher_url: 'https://{{ rancher_domain_name }}:8443'
            seedbox_chart_domain_name: "{{ domain_name }}"
            seedbox_chart_timezone: "Europe/Paris"
            seedbox_chart_seafile_admin_email: "{{ seafile_admin_email }}"
            seedbox_chart_seafile_admin_password: "{{ seafile_admin_password }}"
            seedbox_chart_jackett_username: "{{ jackett_username }}"
            seedbox_chart_jackett_password: "{{ jackett_password }}"
            seedbox_chart_cluterissuer_name: "{{ clusterissuer_name }}"
            path_template_create_directory_in_filesystem_rook_volume: "../seedbox-ansible/templates/install_catalog/create_directory_in_filesystem_rook_volume.sh"
            path_template_append_force_http: "../seedbox-ansible/templates/heimdall/append_force_http.sh"

            radarr_url: "https://radarr.{{ domain_name }}"
            sonarr_url: "https://sonarr.{{ domain_name }}"  
            heimdall_url: "https://heimdall.{{ domain_name }}"

License
-------

MIT

Author Information
------------------

If you have any issue with the project please open one on Github.
Any pull request or improvement idea is welcome.
