# Environment Setup for Fastlane

## Required Environment Variables

To use the Fastfile lanes, you need to set up the following environment variable:

### FIREBASE_CLI_TOKEN

This token is required for Firebase App Distribution. To get this token:

1. Install Firebase CLI if you haven't already:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Generate a CI token:
   ```bash
   firebase login:ci
   ```

4. Copy the generated token and set it as an environment variable.

## Setting up Environment Variables

### Option 1: Create a .env file (Recommended for local development)

Create a file named `.env` in the `android/fastlane/` directory:

```bash
# android/fastlane/.env
FIREBASE_CLI_TOKEN=your_actual_token_here
```

**Important**: The `.env` file is already added to `.gitignore` to prevent committing secrets.

### Option 2: Set as System Environment Variable

#### Windows (PowerShell):
```powershell
$env:FIREBASE_CLI_TOKEN="your_actual_token_here"
```

#### Windows (Command Prompt):
```cmd
set FIREBASE_CLI_TOKEN=your_actual_token_here
```

#### macOS/Linux:
```bash
export FIREBASE_CLI_TOKEN="your_actual_token_here"
```

### Option 3: For CI/CD (GitHub Actions, etc.)

Set the environment variable in your CI/CD platform's secrets management.

## Usage

After setting up the environment variable, you can run the Fastlane lanes:

```bash
# For Firebase distribution only
fastlane android firebase_distribution

# For full release with Shorebird
fastlane android shorebird_full_release

# For minor updates
fastlane android minor_update
```

## Security Notes

- Never commit the actual token to version control
- The `.env` file is automatically ignored by git
- Use different tokens for different environments (dev, staging, prod)
- Rotate tokens regularly for security 