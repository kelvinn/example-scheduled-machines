
# See README.md for how to get these values

TAG="0.0.1" # This comes from CI/CD
MACHINE_ID="e2865c22a34548"  # This comes from secrets in CI/CD, but looks like "e2865c22a34548"
APP_NAME="example-scheduled-machines"

docker build -t registry.fly.io/$APP_NAME:deployment-$TAG . --platform linux/amd64
docker push registry.fly.io/$APP_NAME:deployment-$TAG
fly machine update $MACHINE_ID --yes --image registry.fly.io/$APP_NAME:deployment-$TAG --schedule=hourly --metadata fly_process_group=app
