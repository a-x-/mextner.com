# Deployment Guide for mextner.com

This site can be deployed using either a local script or automatically via GitHub Actions.

## Local Deployment

Run the deployment script:

```bash
./deploy.sh
```

This will:
1. Build the Hugo site with minification
2. Deploy to the server using rsync

## Automatic Deployment (GitHub Actions)

The site will automatically deploy when you push to the `main` branch.

### Initial Setup

1. Generate an SSH key pair for deployment:
   ```bash
   ssh-keygen -t ed25519 -C "github-actions-deploy" -f ~/.ssh/mextner-deploy
   ```

2. Add the public key to the server:
   ```bash
   ssh-copy-id -i ~/.ssh/mextner-deploy.pub www-data@104.248.84.190
   ```

3. Add secrets to your GitHub repository:
   - Go to Settings → Secrets and variables → Actions
   - Add `DEPLOY_SSH_KEY`: Copy the content of `~/.ssh/mextner-deploy` (private key)
   - Add `KNOWN_HOSTS`: Run `ssh-keyscan 104.248.84.190` and paste the output

## Server Requirements

- SSH access as `www-data` user
- Write permissions to `/var/www/mextner.com/`
- rsync installed on the server

## Monitoring Deployments

You can monitor deployment status in the Actions tab of your GitHub repository.

## Troubleshooting

- If deployment fails with permission errors, ensure the `www-data` user has write access to `/var/www/mextner.com/`
- If SSH connection fails, verify that the SSH key is correctly added to the server and GitHub secrets