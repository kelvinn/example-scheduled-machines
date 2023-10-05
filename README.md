# Background

This is a demo repository on how to get scale-to-zero scheduled machines working on Fly.io

# Steps - Fly

First, set up a new app:

```
fly launch
```

? Would you like to copy its configuration to the new app? Yes
? Choose an app name (leaving blank will default to 'example-scheduled-machines')
? Would you like to set up a Postgresql database now? No
? Would you like to set up an Upstash Redis database now? No
? Would you like to deploy now? Yes

The deploy will likely fail, and that's OK.

Next we need to get the machine id, so do a:

```
fly machine list
```

Take that Machine ID (NOT the Name) and add it as an environment variable so we can use it in deploy.sh

```
export MACHINE_ID=[the-machine-id-from-above]
```

Now configure a token in Fly.io (https://fly.io/apps/example-scheduled-machines/tokens), and then add it as an environment variable. This allows us to push docker images directly to the fly registry.

```
export TOKEN="FlyV1 the_really_long_token="
```

And now authenticate to fly:

```
fly auth docker --access-token "$TOKEN"
```

Finally, you can then trigger an initial deployment from CI/CD by calling deploy.sh

```
bash scripts/deploy.sh
```


# Steps - Github Actions

 Take your MACHINE_ID and TOKEN and add them to "Actions secrets and variables" as a Repository Secret in Github (https://github.com/kelvinn/example-scheduled-machines/settings/secrets/actions)

 Update deploy.sh to use the MACHINE_ID and TOKEN from Github Actions
