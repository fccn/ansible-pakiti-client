# ansible-pakiti-client
This role will allow pakiti client instalation using Ansible.
It can be used in two different ways:
    1. One that supports only the instalation
    2. The other way is to only execute/push data to pakiti server

## Requirements

Only ansible.
It was tested using ansible 2.10.

## Role Variables

* Main play
    1. **pakiti_server**: pakiti server fdqn/dns
* Folder defaults
    1. **pakiti_push**: if role will only "push" or if its going to perform a normal instalation
    2. **pakiti_add_cron**: when we want to have a way to only push, we can skip the cronjob creation on the instalation process
    3. **site**: to better identify to which team a server belongs to we have to use a sort of tag
    4. **pakiti_user**: the user that will be created on the server side and that will execute the pakiti client execution
    5. **github_repository_version**: which client version should be installed
    6. **pakiti_cron_weekday**: on which weekdays the cronjob will be executed
    7. **pakiti_cron_minute**: on the weekdays that you chose to execute the client, you have to choose minutes and hours that you want the execution to happen
    8. **pakiti_cron_hour**: on the weekdays that you chose to execute the client, you have to choose minutes and hours that you want the execution to happen
    
* Folder vars
    1. **github_repository**: github link that has the client instalation data
    2. **pakiti_client_path**: where do you want the client to be installed

## Dependencies
Only ansible and a way to elevate privileges to sudo or root, so that the role can install OS dependencies and create the user that will execute the client.

## Example
```jinja

    roles:
        - role: ansible-pakiti-client
          vars: 
            pakiti_server: "pakiti.exemple.com"
```

