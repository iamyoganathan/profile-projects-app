# How to Run & Test Your App

## Quick Start (Recommended for Testing)

### Option 1: Run on Chrome (Web) - Fastest
```bash
cd "d:\Flutter Internship\profile_projects_app"
flutter run -d chrome
```

### Option 2: Run on Your Android Phone
```bash
cd "d:\Flutter Internship\profile_projects_app"
flutter run -d RZCW501JHXE
```

### Option 3: Run on Windows Desktop
```bash
cd "d:\Flutter Internship\profile_projects_app"
flutter run -d windows
```

---

## Testing Checklist

### ✅ Profile Tab Testing
1. Launch the app
2. You should see "Profile" tab selected by default
3. Verify the following are displayed:
   - Profile icon (blue circle with person icon)
   - Name: "Yoganathan C"
   - Intern ID: "MT1286"
   - Bio card with description
   - Contact card with email, phone, location
   - Internship details card with domain, duration, dates
4. Scroll down to see all content

### ✅ Projects Tab Testing
1. Tap on "Projects" tab
2. You should see 2 pre-populated projects:
   - Weather App
   - Todo List
3. Each project card should show:
   - Folder icon
   - Project title
   - Project description

### ✅ Add Project Feature Testing
1. Tap the blue "+" button (Floating Action Button)
2. Dialog should appear with title "Add New Project"
3. Fill in:
   - Project Title: "E-commerce App"
   - Project Description: "Online shopping app with cart and payment"
4. Tap "Add" button
5. Dialog should close
6. New project should appear in the Projects list
7. Try adding another project

### ✅ Navigation Testing
1. Switch between Profile and Projects tabs multiple times
2. Verify smooth transitions
3. Verify tab state is maintained

---

## Building APK (For Submission)

1. **Build the APK:**
```bash
cd "d:\Flutter Internship\profile_projects_app"
flutter build apk --release
```

2. **Find the APK:**
The APK will be at:
```
d:\Flutter Internship\profile_projects_app\build\app\outputs\flutter-apk\app-release.apk
```

3. **APK Size:**
Should be around 15-20 MB (optimized release build)

4. **Test the APK:**
- Transfer to your Android phone
- Install and test all features

---

## Taking Screenshots

### For Android Device
1. Run the app on your phone
2. Use phone's screenshot feature:
   - Volume Down + Power Button (most Android phones)
   - Or use screen recording

### For Web/Desktop
1. Run app in Chrome
2. Use Windows Snipping Tool or Snip & Sketch:
   - Press `Win + Shift + S`
   - Select area to capture

### Screenshots to Take
1. **Profile Tab** - Full view showing all sections
2. **Projects Tab** - Showing the project cards
3. **Add Dialog** - The add project dialog window
4. **Empty State** (optional) - Projects tab when empty

### Where to Save
Create a folder:
```
d:\Flutter Internship\profile_projects_app\screenshots\
```

---

## Common Issues & Solutions

### Issue: "No devices found"
**Solution:** 
```bash
flutter devices
```
Check what devices are connected.

### Issue: Build fails
**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Hot reload not working
**Solution:** 
- Save the file (Ctrl+S)
- Or press 'r' in terminal
- Or press 'R' for hot restart

### Issue: App crashes on Android
**Solution:**
- Check USB debugging is enabled
- Check developer options enabled
- Try on different device/emulator

---

## Performance Tips

- **Hot Reload**: Press 'r' in terminal after code changes
- **Hot Restart**: Press 'R' in terminal for full restart
- **Quit App**: Press 'q' in terminal

---

## Next Steps After Testing

1. ✅ Verify all features work
2. ✅ Build APK
3. ✅ Take screenshots
4. ✅ Create GitHub repository
5. ✅ Push code to GitHub
6. ✅ Share on LinkedIn

---

## Need Help?

**Flutter Commands:**
- `flutter doctor` - Check Flutter setup
- `flutter devices` - List connected devices
- `flutter clean` - Clean build files
- `flutter pub get` - Get dependencies
- `flutter --help` - See all commands

**In Running App:**
- Press `r` - Hot reload
- Press `R` - Hot restart
- Press `q` - Quit
- Press `h` - Help

---

Good luck with your first task! 🚀

*MainCrafts Technology - Flutter App Development Internship*
