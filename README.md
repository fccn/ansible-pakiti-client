# ansible-pakiti-client
This role installs the pakiti client using Ansible. 
It has three different modes that can be activated or disabled using optional variables:
1. install the pakiti client
1. install a cron job that executes the client once every day at a random hour and minute
1. executes the client

## Requirements

Only ansible.
It was tested using ansible 2.10.

## Role Variables

### Required variables
1. `pakiti_server` - pakiti server fdqn/dns
1. `pakiti_site` - to better identify to which team a server belongs to we have to use a sort of tag

### Optional variables
The optional variables are defined on the [defaults/main.yml](defaults/main.yml) file, open it to view the default value for each variable.

1. `pakiti_install` - if role will install the pakiti software
1. `pakiti_install_cron` - when we want to have a way to only push, we can skip the cronjob creation on the installation process
1. `pakiti_push` - if role will execute the pakiti software that sends information to the server
1. `pakiti_user` - the user that will be created on the server side and that will execute the pakiti client execution
1. `pakiti_repository` - which git repository should be installed / cloned
1. `pakiti_repository_version` - which client version should be installed
1. `pakiti_cron_weekday`: on which weekdays the cronjob will be executed, by default every day.
1. `pakiti_cron_hour`: on the weekdays that you chose to execute the client, you have to choose minutes and hours that you want the execution to happen
1. `pakiti_cron_minute`: on the weekdays that you chose to execute the client, you have to choose minutes and hours that you want the execution to happen
1. `github_repository` - git repository link that has the client installation data
1. `pakiti_server_url` - URL that the client uses to send data
1. `pakiti_exec` - client script that will be executed

## Dependencies
Only ansible and a way to elevate privileges to sudo or root, so that the role can install OS dependencies and create the user that will execute the client.

## Example
```jinja

    roles:
        - role: ansible-pakiti-client
          vars: 
            pakiti_server: pakiti.example.com
            pakiti_site: my_team
```

If you want to only run this role without any other role, you can add `--tags pakiti` to your command line.

## Development
Notes about on how to develop this role.

Create a virtual environment and run the linters.
```bash
virtualenv venv --python=python3
. venv/bin/activate
pip install -r requirements/dev.txt
make lint
```
