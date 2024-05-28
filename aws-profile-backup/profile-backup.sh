# Backup directory
BACKUP_DIR=~/aws-backup

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Copy the AWS CLI configuration files to the backup directory
cp ~/.aws/config $BACKUP_DIR/config.bak
cp ~/.aws/credentials $BACKUP_DIR/credentials.bak

echo "Backup of the default AWS CLI configuration completed. Files are saved in $BACKUP_DIR"

