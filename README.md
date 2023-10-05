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

Set an initial TAG for the image

```
export TAG=0.0.1
```

And now authenticate to fly:

```
fly auth docker
```

Finally, you can then trigger an initial deployment from CI/CD by calling deploy.sh

```
bash scripts/deploy.sh
```


# Steps - Github Actions

You will need to get a token to communicate with Fly. On your local machine, where you have already logged in, try:

```
fly auth token
```

And add that as a Repository secret in Github Actions (https://github.com/kelvinn/example-scheduled-machines/settings/secrets/actions). You can find this under "Actions secrets and variables".

While you're there add your MACHINE_ID in as another Repository Secret.
