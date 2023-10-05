# Background

This is a demo repository on how to get scale-to-zero scheduled machines working on Fly.io

# Steps

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

Take that Machine ID (NOT the Name) and add it to  update the ID used in deploy.sh

Now configure a token in Fly.io (https://fly.io/apps/example-scheduled-machines/tokens), and then authenticate. This allows us to push docker images directly to the fly registry.

```
fly auth docker --access-token "FlyV1 the_really_long_token="
```

Finally, you can then trigger an initial deployment from CI/CD by calling deploy.sh

```
bash scripts/deploy.sh
```
