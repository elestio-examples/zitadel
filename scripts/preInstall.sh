#set env vars
set -o allexport; source .env; set +o allexport;

ZITADEL_MASTERKEY="$(tr -dc A-Za-z0-9 </dev/urandom | head -c 32)"

cat <<EOT > ./zitadel-init-steps.yaml
FirstInstance:
  Org:
    Human:
      Username: 'root'
      Password: '$ADMIN_PASSWORD'
      PasswordChangeRequired: false
EOT

cat <<EOT >> ./.env

ZITADEL_MASTERKEY=${ZITADEL_MASTERKEY}
EOT