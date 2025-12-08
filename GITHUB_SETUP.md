# Git Setup Commands for GitHub Repository

## Step-by-Step GitHub Setup

### 1. Initialize Git Repository (Run in project directory)
```bash
cd "d:\Flutter Internship\profile_projects_app"
git init
```

### 2. Add All Files
```bash
git add .
```

### 3. Create Initial Commit
```bash
git commit -m "Task 1: Profile & Projects App - Complete Flutter application with TabBar navigation, Profile tab, Projects tab, and Add Project dialog"
```

### 4. Create GitHub Repository

Go to: https://github.com/new

**Repository Settings:**
- Repository name: `profile-projects-app` or `maincrafts-flutter-task1`
- Description: `Flutter Profile & Projects App - MainCrafts Internship Task 1`
- Visibility: Public (so recruiters can see)
- ❌ Do NOT initialize with README, .gitignore, or license (we already have them)

### 5. Link Remote Repository

Replace `YOUR_USERNAME` and `REPO_NAME` with your actual values:

```bash
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
```

Example:
```bash
git remote add origin https://github.com/yoganathan/profile-projects-app.git
```

### 6. Rename Branch to Main
```bash
git branch -M main
```

### 7. Push to GitHub
```bash
git push -u origin main
```

---

## Alternative: Using GitHub CLI

If you have GitHub CLI installed:

```bash
cd "d:\Flutter Internship\profile_projects_app"
git init
git add .
git commit -m "Task 1: Complete Profile & Projects App"
gh repo create profile-projects-app --public --source=. --remote=origin
git push -u origin main
```

---

## After Pushing to GitHub

### Add Topics/Tags to Repository
On GitHub repository page, add these topics:
- `flutter`
- `dart`
- `mobile-app`
- `android`
- `internship`
- `maincrafts`
- `flutter-ui`
- `tabbar`
- `material-design`

### Update Repository Description
```
Flutter Profile & Projects App built during MainCrafts Technology Internship. Features TabBar navigation, state management, and Material Design UI.
```

### Add Website Link (Optional)
If you deploy to web, add the live URL

---

## Quick Copy-Paste Commands

```bash
# Navigate to project
cd "d:\Flutter Internship\profile_projects_app"

# Initialize Git
git init

# Add all files
git add .

# Commit
git commit -m "Task 1: Profile & Projects App - MainCrafts Internship"

# Add remote (REPLACE WITH YOUR REPO URL)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push
git branch -M main
git push -u origin main
```

---

## Verify Your Push

After pushing, verify on GitHub:
- ✅ All files are visible
- ✅ README.md displays correctly
- ✅ Code is properly formatted
- ✅ .gitignore is working (no build files)

---

## Repository URL Format

Your final GitHub URL will be:
```
https://github.com/YOUR_USERNAME/profile-projects-app
```

Use this URL for:
- LinkedIn post
- Resume/Portfolio
- Internship submission

---

## Common Git Issues

### Issue: "remote origin already exists"
```bash
git remote remove origin
git remote add origin YOUR_NEW_URL
```

### Issue: Authentication failed
Use GitHub Personal Access Token instead of password:
1. Go to GitHub Settings → Developer Settings → Personal Access Tokens
2. Generate new token with `repo` permissions
3. Use token as password when pushing

Or use GitHub Desktop app for easier management.

---

## .gitignore Already Included

The project already has `.gitignore` that excludes:
- Build files (`/build/`)
- IDE files (`.idea/`, `*.iml`)
- Dependencies (`.dart_tool/`, `.pub-cache/`)
- OS files (`.DS_Store`)

So only source code and configuration will be pushed.

---

## GitHub Repository Checklist

- [ ] Repository created on GitHub
- [ ] Code pushed successfully
- [ ] README displays correctly
- [ ] All source files present
- [ ] No build/binary files
- [ ] Topics/tags added
- [ ] Description added
- [ ] Repository is Public

---

**Ready to push your code to GitHub!** 🚀

*MainCrafts Technology Internship - Task 1*
